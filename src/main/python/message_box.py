from PyQt5.QtWidgets import QMessageBox

class MessageBox(QMessageBox):

    def __init__(self, noti_text=''):
        super(MessageBox, self).__init__()
        self.setWindowTitle("Notification")
        self.setText(noti_text)
        self.exec_()