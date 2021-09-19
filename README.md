![Python Version][python-shield]
![PyQt5 Version][pyqt5-shield]
![QtQML Version][qtqml-shield]
[![MIT License][license-shield]][license-url]



<!-- PROJECT LOGO -->
<br />
<p align="center">
    <img src="images/logo.png" alt="Logo" width="80" height="80"></img>

  <h2 align="center">NetTruyen Downloader</h2>

  <p align="center">
    A tool to download manga on <a href=http://www.nettruyenpro.com>NetTruyen</a>
    <br />
    <br />
    <a href="#download">Download</a>
    ·
    <a href="#how-to-use">View Demo</a>
    ·
    <a href="https://github.com/quantrancse/nettruyen-downloader-minimal">Minimal Version</a>
    ·
    <a href="https://github.com/quantrancse/nettruyen-downloader-script">Script Version</a>
  </p>
</p>



<!-- TABLE OF CONTENTS -->
## Table of Contents

- [Table of Contents](#table-of-contents)
- [About The Project](#about-the-project)
  - [Features](#features)
  - [Recommend Manga Viewer](#recommend-manga-viewer)
- [Download](#download)
- [How To Use](#how-to-use)
- [Build Project](#build-project)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Issues](#issues)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)
- [Acknowledgements](#acknowledgements)

<!-- ABOUT THE PROJECT -->
## About The Project
[Update: 06-07-2021] This tool still working if nettruyen change domain.

[Other] I've found a Tampermonkey script that works on different manga sites: https://github.com/lelinhtinh/Userscript/tree/master/manga_comic_downloader

Thanks to the author and use it by your own way.

---

**_Notes:_** _This tool is a personal standalone project, it does not have any related to [NetTruyen](http://www.nettruyenpro.com) administrators._

### Features
* Show some information about manga and a list of chapters.
* Download a manga by select chapters in checkboxes or enter from one chapter to another chapter.
* Download all chapters in the manga.
* Update new chapters or download missing chapters of an already downloaded manga.
* Download images by multithreading to speed up.
* Keep original image format if possible.
* Working with [NhatTruyen](http://nhattruyenvip.com/) or some manga redirect to [NhatTruyen](http://nhattruyenvip.com/)

##### Recommend Manga Viewer

* I have found a good image viewer application that perfectly suited for reading manga - [QuickViewer](https://kanryu.github.io/quickviewer/)

<!-- Download -->
## Download

**Windows**: [nettruyen_downloader.exe ~ 50MB](https://rebrand.ly/nettruyen-downloader)

**Windows**: [nettruyen_minimal.exe ~ 35MB](https://rebrand.ly/nettruyen_minimal)

<!-- USAGE EXAMPLES -->
## How To Use

![Demo](images/demo.gif)

<!-- Build Project -->
## Build Project

### Prerequisites

* python 3.9.6
* Windows 10 SDK
* PyQt5
* pyinstaller
```sh
pip install bs4 requests pyqt5 pyinstaller
```
* Some IDE if needed: Qt Creator, Qt Designer

### Installation

* Clone the repo
```sh
git clone https://github.com/quantrancse/nettruyen-downloader.git
```
* Modify the source code
* Modify the QML files
* Use pyrcc5 to compile Qt resource file (.qrc) and converts it into a Python module for PyQt5 application
```sh
pyrcc5 src.qrc -o src.py
```
* Build .exe file
```sh
pyinstaller ./nettruyen.spec
```

<!-- ISSUES -->
## Issues

* May take a long time or spamming error messages when download images on a slow internet connection or slow connection to the image host.
* May cause blocked by image host because multithreading sending too many requests.
* Suddenly stop the application when downloading may cause lagging or not responding because the download thread is still running.
* Can not download multiple chapters in parallel because [NetTruyen](http://www.nettruyenpro.com) has blocked requests per second and may be performace issues.

<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<!-- LICENSE -->
## License

Distributed under the MIT License. See [LICENSE][license-url] for more information.

<!-- CONTACT -->
## Contact

* **Author** - [@quantrancse](https://quantrancse.github.io)

<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements
* [PyQt5 tutorial](https://build-system.fman.io/pyqt5-tutorial)
* [Qt Documentation](https://doc.qt.io/)

<!-- MARKDOWN LINKS & IMAGES -->
[python-shield]: https://img.shields.io/badge/python-3.9.6-brightgreen?style=flat-square
[pyqt5-shield]: https://img.shields.io/badge/PyQt5-5.14.1-blue?style=flat-square
[qtqml-shield]: https://img.shields.io/badge/QtQML-5.14.1-brightgreen?style=flat-square
[license-shield]: https://img.shields.io/github/license/quantrancse/nettruyen-downloader?style=flat-square
[license-url]: https://github.com/quantrancse/nettruyen-downloader/blob/master/LICENSE
