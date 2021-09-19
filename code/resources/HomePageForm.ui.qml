import QtQuick 2.4
import QtQuick.Controls 2.13

PageBackground {
    id: homePage
    property alias searchButton: searchButton
    property alias link: link
    property alias authorLink: authorLink

    Rectangle {
        id: grid
        x: 101
        y: 206
        width: 892
        height: 288
        color: "#673ab7"
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

        Image {
            id: image
            width: 353
            height: 63
            anchors.left: label.right
            source: "appIcon/logo-nettruyen-big.png"
            fillMode: Image.PreserveAspectFit

        }

        Label {
            id: downloaderLabel
            height: 63
            color: "#ffffff"
            text: qsTr("Downloader")
            anchors.left: image.right
            font.bold: true
            font.pointSize: 31
            font.family: "Verdana"
        }

        Label {
            id: label
            width: 180
            height: 180
            color: "#ffffff"
            text: qsTr("N")
            anchors.verticalCenter: parent.verticalCenter
            anchors.top: image.bottom
            font.weight: Font.Bold
            font.bold: true
            font.pointSize: 85
            font.family: "Verdana"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }

        TextField {
            objectName: "textField"
            background: Rectangle {
                color: "white"
            }
            id: link
            height: 70
            text: qsTr("")
            anchors.top: downloaderLabel.bottom
            anchors.topMargin: 50
            selectByMouse: true
            padding: 10
            anchors.right: parent.right
            font.pointSize: 14
            font.family: "Arial"
            placeholderText: "Paste manga link..."
            anchors.left: label.right
            anchors.leftMargin: 20
        }

        RoundButton {
            id: searchButton
            x: 488
            y: 223
            width: 208
            height: 70
            text: qsTr("SEARCH")
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: link.horizontalCenter
            radius: 5
            font.bold: true
            font.pointSize: 14
            font.family: "Verdana"
            highlighted: true
        }
    }

    Label {
        id: authorLabel
        x: 537
        y: 552
        width: 222
        height: 27
        color: "#ffffff"
        text: qsTr("Created by: quantrancse | v1.2.1")
        anchors.horizontalCenter: parent.horizontalCenter
        font.pointSize: 10
        font.family: "Verdana"
        horizontalAlignment: Text.AlignLeft

        MouseArea {
            id: authorLink
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor
            anchors.fill: parent
        }
    }
}
