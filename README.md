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
    A tool to download manga on <a href=http://www.nettruyen.com>NetTruyen.com</a>
    <br />
    <br />
    <a href="#how-to-use">View Demo</a>
    ·
    <a href="https://github.com/quantrancse/nettruyen-downloader-minimal">Minimal Version</a>
  </p>
</p>



<!-- TABLE OF CONTENTS -->
## Table of Contents

- [Table of Contents](#table-of-contents)
- [About The Project](#about-the-project)
  - [Features](#features)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [How To Use](#how-to-use)
  - [Recommended Manga Viewer](#recommended-manga-viewer)
- [Issues](#issues)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)
- [Acknowledgements](#acknowledgements)

<!-- ABOUT THE PROJECT -->
## About The Project

[NetTruyen.com](http://www.nettruyen.com) is a popular manga website with a lightweight and clear front-end, however, each manga has a different image size which causes it difficult to read and uncomfortable to resize the whole browser. So I want to create a tool to download a manga for reading offline and also learn some new skills about GUI for Python.

**_Notes:_** _This tool is a personal standalone project, it does not have any related to [NetTruyen.com](http://www.nettruyen.com) administrators._

### Features
* Show some information about manga and list of chapters.
* Download a manga by select chapter in checkboxes or enter from one chapter to another chapter.
* Download all chapter in the manga.
* Update new chapter or download missing chapters of an already exist manga.
* Download images by multithreading to speed-up.
* Keep original image format if possible.
* Still working with [NhatTruyen.com](http://nhattruyen.com/) or some manga redirect to [NhatTruyen.com](http://nhattruyen.com/)

At the start, I intended to develop a whole [NetTruyen.com](http://www.nettruyen.com) homepage with many features like searching or saving followed manga. But I think it will be more comfortable to do it on the website. (and I'm too lazy)


<!-- GETTING STARTED -->
## Getting Started

For the ones who want to develop this project in the future or make it for other manga website.
<br />
<br />
I just only test it on Windows platform but the source code can be built to run on Mac or Linux with some modifications about the os path.

### Prerequisites

* python 3.6.8
* PyQt5
```sh
pip install pyqt5
```
* pyrcc5
* fbs or pyinstaller
```sh
pip install fbs
```
* Some IDE if needed: Qt Creator, Qt Designer

**_Notes:_** _fbs does not run with python > 3.6, so if you want to build with higher python version please use pyinstaller_

### Installation

* Clone the repo
```sh
git clone https://github.com/quantrancse/nettruyen-downloader.git
```
* Modify the source code
* Modify the QML files
* Use pyrcc5 to compile Qt resource file (.qrc) and converts it into a Python module for PyQt5 applications
```sh
pyrcc5 src.qrc -o src.py
```
* Run the code
```sh
fbs run
```
* Build .exe file
```sh
fbs freeze
```

* More info about fbs: [fbs-tutorial](https://github.com/mherrmann/fbs-tutorial)

<!-- USAGE EXAMPLES -->
## How To Use

![Demo](images/demo.gif)

### Recommended Manga Viewer

* I have found a good image viewer application that perfectly suited for reading manga - [QuickViewer](https://kanryu.github.io/quickviewer/)

<!-- ROADMAP -->
## Issues

* Quietly slow in performance and large size in comparison to Qt on C++/C#.
* May take a long time to download images on slow internet connection or connection to the image host.
* May cause blocked by image host because multithreading sending too many requests.
* Suddenly stop the application when downloading may cause lagging or not responding because the download thread is still running.
* Can not download multiple chapters in parallel because [NetTruyen.com](http://www.nettruyen.com) has blocked requests per second.



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

* **Author** - [@quantrancse](https://www.facebook.com/quantrancse)

<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements
* [PyQt5 tutorial](https://build-system.fman.io/pyqt5-tutorial)
* [Qt Documentation](https://doc.qt.io/)
* [fbs tutorial](https://github.com/mherrmann/fbs-tutorial)

<!-- MARKDOWN LINKS & IMAGES -->
[python-shield]: https://img.shields.io/badge/python-3.6.8-brightgreen?style=flat-square
[pyqt5-shield]: https://img.shields.io/badge/PyQt5-5.14.1-blue?style=flat-square
[qtqml-shield]: https://img.shields.io/badge/QtQML-5.14.1-brightgreen?style=flat-square
[license-shield]: https://img.shields.io/github/license/quantrancse/nettruyen-downloader?style=flat-square
[license-url]: https://github.com/quantrancse/nettruyen-downloader/blob/master/LICENSE
