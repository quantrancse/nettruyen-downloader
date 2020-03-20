from PyQt5.QtCore import QRect, Qt, pyqtSignal, pyqtSlot
from PyQt5.QtGui import QFont
from PyQt5.QtWidgets import QDialog, QLabel, QProgressBar, QPushButton


class WaitingDialog(QDialog):

    stop_signal = pyqtSignal()

    def initUI(self):
        # Dialog
        self.Dialog = QDialog()
        self.Dialog.resize(500, 200)
        self.Dialog.setWindowFlags(Qt.MSWindowsFixedSizeDialogHint)
        font = QFont()
        font.setFamily('Verdana')
        self.Dialog.setFont(font)
        self.Dialog.setModal(True)
        self.Dialog.setWindowTitle('Please Wait ...')
        self.Dialog.setWindowFlags(Qt.WindowTitleHint)

        # Progress Bar
        self.progressBar = QProgressBar(self.Dialog)
        self.progressBar.setGeometry(QRect(30, 80, 451, 31))
        self.progressBar.setMaximum(100)
        self.progressBar.setValue(0)

        # Status
        self.label = QLabel(self.Dialog)
        self.label.setEnabled(True)
        self.label.setGeometry(QRect(30, 25, 441, 41))
        font = QFont()
        font.setFamily('Verdana')
        font.setPointSize(9)
        self.label.setFont(font)
        self.label.setText('Preparing ...')

        # Cancel/Close Button
        self.cancelButton = QPushButton('Cancel', self.Dialog)
        self.cancelButton.setGeometry(QRect(190, 140, 111, 31))
        self.cancelButton.clicked.connect(self.cancel)

    def run(self):
        self.Dialog.exec_()

    def cancel(self):
        self.stop_signal.emit()
        self.label.setText('Please wait ...')
        self.cancelButton.setEnabled(False)

    @pyqtSlot(int)
    def updateProgressBar(self, num):
        self.progressBar.setValue(num)

    @pyqtSlot(str)
    def updateChapterName(self, chapter_name):
        self.label.setText(chapter_name)

    @pyqtSlot(int)
    def setMaxProgessBarValue(self, max_value):
        self.progressBar.setMaximum(max_value)

    @pyqtSlot()
    def closeWhenDone(self):
        self.cancelButton.setText('Close')
        self.label.setText('Download Finished!')
        self.cancelButton.clicked.connect(self.Dialog.close)
        self.cancelButton.setEnabled(True)
