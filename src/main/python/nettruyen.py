import os
import sys
import time
from concurrent.futures import ThreadPoolExecutor
from os import mkdir
from os.path import abspath, dirname, isdir, join

from fbs_runtime.application_context.PyQt5 import ApplicationContext
from PyQt5.QtCore import QObject, QUrl, pyqtSlot
from PyQt5.QtGui import QIcon
from PyQt5.QtQml import QQmlApplicationEngine
from PyQt5.QtWidgets import QApplication

import requests
import src
from bs4 import BeautifulSoup
from download_engine import DownloadEngine
from input_chapter import IndputChapterDialog
from manga_info import MangaInfo
from message_box import MessageBox
from waiting_dialog import WaitingDialog

HEADERS = {
    'user-agent': ('Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.47 Safari/537.36')}


class Bridge(QObject):

    current_manga = MangaInfo()

    @pyqtSlot(str, result=str)
    def checkValidUrl(self, input_str):

        if not any(x in input_str for x in ['nhattruyen.com/truyen-tranh/', 'nettruyen.com/truyen-tranh/']):
            return 'ErrorPage.qml'
        else:
            try:
                request = requests.get(input_str, timeout=5)
                soup = BeautifulSoup(request.text, 'html.parser')

                if not soup.find('div', id='nt_listchapter'):
                    return 'ErrorPage.qml'
                else:
                    self.current_manga.manga_url = str(input_str)
                    self.crawlMangaHomePage()
                    return 'MangaPage.qml'
            except:
                MessageBox("Error in connect manga page. Please try again.")
                print('Error in connect manga page !')

    @pyqtSlot(result=str)
    def getMangaThumbnail(self):
        return self.current_manga.thumbnail

    @pyqtSlot(result=str)
    def getMangaName(self):
        return self.current_manga.manga_name

    @pyqtSlot(result=str)
    def getMangaAuthor(self):
        return self.current_manga.author

    @pyqtSlot(result=str)
    def getMangaCategories(self):
        return self.current_manga.categories

    @pyqtSlot(result=str)
    def getMangaViewed(self):
        return self.current_manga.viewed

    @pyqtSlot(result=str)
    def getMangaDescription(self):
        return self.current_manga.description

    @pyqtSlot(result=str)
    def getMangaLastUpdated(self):
        return self.current_manga.last_updated

    @pyqtSlot(result=str)
    def getMangaLastChapter(self):
        return self.current_manga.lastest_chapter

    @pyqtSlot(result=list)
    def getChapterList(self):
        return self.current_manga.chapter_name_list

    def getChapterIndex(self, chapter_input):
        for chapter in self.current_manga.chapter_name_list:
            chapter_name = chapter.split()[1]
            if ':' in chapter_name:
                chapter_name = chapter_name[:-1]
            if chapter_input == chapter_name:
                return self.current_manga.chapter_name_list.index(
                    chapter)
        return None

    @pyqtSlot(str, str)
    def getChapterInput(self, from_chapter_input, to_chapter_input):
        from_chapter_index = self.getChapterIndex(from_chapter_input)
        to_chapter_index = self.getChapterIndex(to_chapter_input)

        if from_chapter_index is not None and to_chapter_index is not None:
            if from_chapter_index > to_chapter_index:
                from_chapter_index, to_chapter_index = to_chapter_index, from_chapter_index
            self.current_manga.list_of_download_chapter = list(
                range(from_chapter_index, to_chapter_index + 1))

    def getListOfDownloadChapter(self, list_of_chapters):
        if not list_of_chapters:
            inputDialog = IndputChapterDialog()
            inputDialog.chapterInput.connect(self.getChapterInput)
            inputDialog.start()
        elif list_of_chapters[0] == 'all':
            self.current_manga.list_of_download_chapter = list(
                range(len(self.current_manga.chapter_name_list)))
        else:
            self.current_manga.list_of_download_chapter = sorted(
                list_of_chapters)

        return self.current_manga.list_of_download_chapter

    @pyqtSlot(str, list)
    def downloadChapter(self, input_str, list_of_chapters):

        if self.getListOfDownloadChapter(list_of_chapters):
            path = input_str[8:] + '/' + \
                self.current_manga.manga_name
            path = path.replace('\"', '').replace('\'', '')
            if not isdir(path):
                mkdir(path)

            self.current_manga.save_path = path

            engine = DownloadEngine(self)
            engine.setManga(self.current_manga)
            dialog = WaitingDialog()
            dialog.initUI()
            engine.valueProgress.connect(dialog.updateProgressBar)
            engine.maxProgressValue.connect(dialog.setMaxProgessBarValue)
            engine.chapterName.connect(dialog.updateChapterName)
            engine.isDone.connect(dialog.closeWhenDone)
            dialog.stop_signal.connect(engine.stopDownload)
            engine.start()
            dialog.run()

    def crawlMangaHomePage(self):
        try:
            print('Start crawling ---------', self.current_manga.manga_url)
            request = requests.get(self.current_manga.manga_url,  timeout=10)
            soup = BeautifulSoup(request.text, 'html.parser')

            self.current_manga.manga_name = soup.find(
                'h1', class_='title-detail').text
            self.current_manga.thumbnail = soup.find(
                'div', class_='col-image').find('img')['src']
            self.current_manga.author = soup.find('li', class_='author').find(
                'p', class_='col-xs-8').string

            categories_list = [x.string for x in soup.find(
                'li', class_='kind').find('p', class_='col-xs-8').find_all('a')]
            s = ' - '
            self.current_manga.categories = s.join(
                categories_list)

            self.current_manga.viewed = soup.find(
                'ul', class_='list-info').find_all('li', class_='row')[-1].find('p', class_='col-xs-8').text
            self.current_manga.last_updated = soup.find(
                'time', class_='small').string.strip()[15:-1]

            manga_lastest_chapter = soup.find('div', id='nt_listchapter').find_all(
                'li')[1].find('div', class_='chapter').find('a').text
            if ':' in manga_lastest_chapter:
                manga_lastest_chapter = manga_lastest_chapter.split(':')[0]
            self.current_manga.lastest_chapter = manga_lastest_chapter

            self.current_manga.description = soup.find(
                'div', class_='detail-content').find('p').text
            self.current_manga.chapter_name_list = [
                i.find('a').text for i in soup.find_all('div', class_='chapter')]

            chapter_url_list = []
            for chapter in soup.find('div', id='nt_listchapter').find('ul').find_all('a'):
                chapter_url_list.append(chapter['href'])
            self.current_manga.chapter_url_list = chapter_url_list

        except:
            MessageBox("Error in crawling manga data!")
            print('exception crawling manga !')


if __name__ == '__main__':

    appctxt = ApplicationContext()
    os.environ['QT_QUICK_CONTROLS_STYLE'] = 'Material'

    engine = QQmlApplicationEngine()
    # qmlFile = join(dirname(__file__), 'resources/view.qml')
    # engine.load(QUrl(qmlFile))
    engine.load(QUrl('qrc:/resources/view.qml'))

    # Bridge to GUI
    bridge = Bridge()

    # Expose the Python object to QML
    context = engine.rootContext()
    context.setContextProperty('con', bridge)

    exit_code = appctxt.app.exec_()
    sys.exit(exit_code)
