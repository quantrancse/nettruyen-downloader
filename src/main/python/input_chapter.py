
from PyQt5.QtCore import QMetaObject, QRect, Qt, pyqtSignal
from PyQt5.QtGui import QFont
from PyQt5.QtWidgets import QDialog, QDialogButtonBox, QLabel, QLineEdit


class IndputChapterDialog(QDialog):

    chapterInput = pyqtSignal(str, str)

    def initUI(self):
        # Dialog
        self.Dialog = QDialog()
        self.Dialog.setWindowModality(Qt.NonModal)
        self.Dialog.resize(410, 190)
        self.Dialog.setWindowFlags(Qt.MSWindowsFixedSizeDialogHint)
        font = QFont()
        font.setFamily('Verdana')
        self.Dialog.setFont(font)
        self.Dialog.setModal(True)
        self.Dialog.setWindowTitle('Please Input Chapter ...')

        # Button Box
        self.buttonBox = QDialogButtonBox(self.Dialog)
        self.buttonBox.setGeometry(QRect(190, 140, 201, 32))
        self.buttonBox.setOrientation(Qt.Horizontal)
        self.buttonBox.setStandardButtons(
            QDialogButtonBox.Cancel | QDialogButtonBox.Ok)

        # From Chapter
        self.labelFromChapter = QLabel(self.Dialog)
        self.labelFromChapter.setGeometry(QRect(20, 30, 121, 31))
        font = QFont()
        font.setFamily('Verdana')
        font.setPointSize(9)
        self.labelFromChapter.setFont(font)
        self.labelFromChapter.setText('From Chapter:')

        self.inputFromChapter = QLineEdit(self.Dialog)
        self.inputFromChapter.setGeometry(QRect(140, 30, 251, 31))

        # To Chapter
        self.labelToChapter = QLabel(self.Dialog)
        self.labelToChapter.setGeometry(QRect(20, 80, 91, 31))
        font = QFont()
        font.setFamily('Verdana')
        font.setPointSize(9)
        self.labelToChapter.setFont(font)
        self.labelToChapter.setText('To Chapter:')

        self.inputToChapter = QLineEdit(self.Dialog)
        self.inputToChapter.setGeometry(QRect(140, 80, 251, 31))

        # Signal
        self.buttonBox.accepted.connect(self.getChapterInput)
        self.buttonBox.rejected.connect(self.Dialog.reject)
        QMetaObject.connectSlotsByName(self.Dialog)

    def start(self):
        self.initUI()
        self.Dialog.exec_()

    def getChapterInput(self):
        self.chapterInput.emit(
            self.inputFromChapter.text(), self.inputToChapter.text())
        self.Dialog.close()
