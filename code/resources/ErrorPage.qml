import QtQuick 2.4

ErrorPageForm {
    backButton.onClicked: {
        pageLoader.source = "HomePage.qml"
    }
}
