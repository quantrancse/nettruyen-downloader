import time
from concurrent.futures import ThreadPoolExecutor
from os import mkdir
from os.path import isdir

from PyQt5.QtCore import QThread, pyqtSignal, pyqtSlot

import requests
from bs4 import BeautifulSoup
from manga_info import MangaInfo
from message_box import MessageBox

HEADERS = {
    'user-agent': ('Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.47 Safari/537.36')}


class DownloadEngine(QThread):

    stop_signal = 0

    valueProgress = pyqtSignal(int)
    maxProgressValue = pyqtSignal(int)
    chapterName = pyqtSignal(str)
    isDone = pyqtSignal()

    def __init__(self, parent=None):
        super(DownloadEngine, self).__init__(parent)

    def setManga(self, manga):
        self.current_manga = manga
        self.image_formats = ['.jpg', '.jpeg', '.png', '.gif', '.tiff', '.bmp']

    @pyqtSlot()
    def stopDownload(self):
        self.stop_signal = 1

    def run(self):
        self.crawlChapterDataList()

    def crawlChapterDataList(self):
        chapter_list = []

        # Get each chapter info
        for index in self.current_manga.list_of_download_chapter:
            chapter_detail = {}
            chapter_detail['chapter_url'] = self.current_manga.chapter_url_list[index]
            chapter_detail['chapter_name'] = self.current_manga.chapter_name_list[index]
            if ':' in chapter_detail['chapter_name']:
                chapter_detail['chapter_name'] = chapter_detail['chapter_name'].split(':')[
                    0]
            chapter_list.append(chapter_detail)

        # Remove downloaded chapters | if not create directory
        chapter_list = [i_chapter for i_chapter in chapter_list if not isdir(
            self.current_manga.save_path + '/' + i_chapter['chapter_name'])]
        chapter_list = list(reversed(chapter_list))

        if chapter_list:
            # Set progress bar max value at 100%
            self.maxProgressValue.emit(len(chapter_list))

            # Create directory and start to download
            index = 0
            for chapter_data in chapter_list:

                if self.stop_signal:
                    break

                chapter_dir_path = self.current_manga.save_path + \
                    '/' + chapter_data['chapter_name']
                mkdir(chapter_dir_path.replace('\"', '').replace('\'', ''))
                chapter_data['chapter_dir_path'] = chapter_dir_path
                self.getChapterContents(chapter_data)
                index += 1
                self.valueProgress.emit(index)   # Update progress bar

        # Update download Finish Dialog
        self.isDone.emit()
        if chapter_list:
            self.valueProgress.emit(len(chapter_list))
        else:
            self.valueProgress.emit(100)
        print('Download Done')

    def getImageUrls(self, soup):
        contents = []

        for content_url in soup.find('div', class_='reading-detail box_doc').find_all('img'):
            if content_url not in contents:
                if any(img_fm in content_url['src'] for img_fm in self.image_formats):
                    contents.append(content_url['src'])
                elif content_url.has_attr('data-cdn') and any(img_fm in content_url['data-cdn'] for img_fm in self.image_formats):
                    contents.append(content_url['data-cdn'])
                elif content_url.has_attr('data-original'):
                    contents.append(content_url['data-original'])
                else:
                    contents.append(content_url['src'])
        return contents

    def getImagePaths(self, chapter_dir_path, contents):
        img_path_list = []
        image_index = 1

        for img_url in contents:
            img_name = img_url.split('/')[-1]
            if any(img_fm in img_name[-4:] for img_fm in self.image_formats):
                img_path_name = chapter_dir_path + '/image_' + img_name
            else:
                img_path_name = chapter_dir_path + \
                    '/image_' + "{0:0=3d}".format(image_index) + '.jpg'
            img_path_list.append(img_path_name)
            image_index += 1

        return img_path_list

    def getChapterContents(self, chapter_data):
        try:
            # Request chapter url
            request = requests.get(
                chapter_data['chapter_url'], headers=HEADERS, timeout=10)
            soup = BeautifulSoup(request.text, 'html.parser')

            # Get image url
            contents = self.getImageUrls(soup)

            # Get image name
            img_path_list = self.getImagePaths(
                chapter_data['chapter_dir_path'], contents)

            image_data_list = list(
                map(lambda x, y: (x, y), img_path_list, contents))

            # Update Dialog
            chapter_name = 'Downloading ' + \
                chapter_data['chapter_name'] + ' .....'
            print(chapter_name)
            self.chapterName.emit(chapter_name)

            # Threading for download each image
            with ThreadPoolExecutor(max_workers=20) as executor:
                executor.map(self.downloadImage, image_data_list)
        except:
            MessageBox("Error get chapter info. Please try again later.")
            print('Error Get Chapter Info: ' + chapter_data['chapter_url'])

        print('Finish ' + chapter_data['chapter_name'])

    def downloadImage(self, image_data_list):
        if not self.stop_signal:
            img_path_name, img_url = image_data_list

            # Limit download time of an image is 5 secs
            start = time.time()
            timeout = 10
            while True:
                try:
                    img_data = requests.get(
                        img_url, headers=HEADERS, timeout=5).content
                    with open(img_path_name, 'wb') as handler:
                        handler.write(img_data)
                    break
                except:
                    if time.time() - start > timeout:
                        MessageBox("Error download image: " + img_path_name)
                        break
                    print('Retry: download image: ' + img_url)
                    time.sleep(1)
                    continue
