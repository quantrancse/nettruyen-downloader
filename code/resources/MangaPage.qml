import QtQuick 2.4
import QtQuick.Controls 2.13
import QtQuick.Controls.Material 2.0
import QtQuick.Layouts 1.3

PageBackground {
    id: mangaPage
    width: 1200
    height: 600
    property alias loadFrame: loadFrame

    StackLayout {
        id: swipeView
        anchors.bottom: tabBar.top
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.top: parent.top
        currentIndex: tabBar.currentIndex

    }

    TabBar {
        id: tabBar
        height: 42
        spacing: 3
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.bottomMargin: -1

        TabButton {
            text: "MANGA INFO"
            font.bold: true
            font.family: "Verdana"
            Material.foreground: "white"
            background: Rectangle{
                color: "#673ab7"
                anchors.fill: parent
            }
            onClicked: {
                loadFrame.source = "MangaInfo.qml"
            }
        }

        TabButton {
            text:  "MANGA CHAPTER"
            font.bold: true
            font.family: "Verdana"
            Material.foreground: "white"
            background: Rectangle{
                anchors.fill: parent
                color: "#673ab7"
            }
            onClicked: {
                loadFrame.source = "MangaChapter.qml"
            }
        }
    }

    Rectangle {
        id: mainFrame
        color: "#673ab7"
        anchors.bottom: tabBar.top
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.top: parent.top

        Loader {
            id: loadFrame
            source: "MangaInfo.qml"
        }
    }
}