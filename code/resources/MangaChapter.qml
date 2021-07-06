import QtQuick 2.4
import QtQuick.Controls 2.13
import QtQuick.Controls.Material 2.0
import Qt.labs.platform 1.1

PageBackground {
    id: mangaChapter
    width: 1200
    height: 558
    property var list_of_chapters: []

    Component.onCompleted: {
        mangaThumbnail.source = con.get_manga_thumbnail()
        mangaName.text = con.getMangaName()
        chapterList.model = con.get_chapter_list()
    }

    Label {
        id: mangaName
        x: 75
        y: 8
        width: 892
        height: 58
        color: "#ffffff"
        text: qsTr("MangaName")
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        anchors.bottomMargin: 84
        font.bold: true
        font.pointSize: 16
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignLeft
        font.family: "Verdana"
    }

    Image {
        id: mangaThumbnail
        x: 75
        y: 99
        width: 200
        height: 300
        fillMode: Image.PreserveAspectFit
        source: ""
    }

    Rectangle {
        id: chapterListBackground
        x: 400
        y: 99
        width: 642
        height: 300
        color: "#ffffff"

        ListView {
            id: chapterList
            anchors.topMargin: 35
            anchors.bottomMargin: 35
            anchors.fill: parent
            delegate: CheckBox {
                id: check_box
                text: modelData

                onCheckedChanged:  {
                    if (list_of_chapters.includes(index)) {
                        list_of_chapters.splice(list_of_chapters.indexOf(index), 1)
                    }
                    else {
                        list_of_chapters.push(index)
                    }
                }
            }

            ScrollBar.vertical: ScrollBar {
                policy: ScrollBar.AlwaysOn
            }
        }
    }

    RoundButton {
        id: downloadButton
        x: 543
        y: 420
        width: 150
        height: 60
        radius: 5
        text: qsTr("Download")
        anchors.right: downloadAllButton.left
        anchors.rightMargin: 25
        highlighted: true
        font.bold: true
        font.pointSize: 9
        font.family: "Verdana"

        onClicked: {
            folderDialogdownload_chapter.open()
        }
    }

    RoundButton {
        id: downloadAllButton
        x: 790
        y: 420
        width: 300
        height: 60
        radius: 5
        text: qsTr("Download/Update All")
        Material.accent: Material.Red
        anchors.right: chapterListBackground.right
        font.pointSize: 9
        font.bold: true
        highlighted: true
        font.family: "Verdana"

        onClicked: {
            folderDialogDownloadAllChapter.open()
        }
    }

    RoundButton {
        id: backButton
        x: 75
        y: 466
        width: 120
        height: 51
        radius: 5
        text: qsTr("BACK")
        highlighted: true
        font.bold: true
        font.pointSize: 8
        font.family: "Verdana"

        onClicked: {
            pageLoader.source = "HomePage.qml"
        }
    }


   FolderDialog{
       id: folderDialogDownloadAllChapter
       title: "Please choose save folder"
       onAccepted: {
           con.download_chapter(folderDialogDownloadAllChapter.folder, ["all"])
       }
   }

   FolderDialog{
       id: folderDialogdownload_chapter
       title: "Please choose save folder"
       onAccepted: {
            con.download_chapter(folderDialogdownload_chapter.folder, list_of_chapters)
       }
   }
}



/*##^##
Designer {
    D{i:4;anchors_height:300;anchors_width:642}
}
##^##*/
