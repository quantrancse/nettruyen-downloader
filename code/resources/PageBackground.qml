import QtQuick 2.0
import QtQuick.Controls 2.13

Rectangle {
    id: rectangle1
    width: 1200
    height: 600
    color: "#673ab7"
    clip: true

    Rectangle {
        id: rectangle
        x: 966
        width: 355
        height: 185
        color: "#9c27b0"
        anchors.top: parent.top
        anchors.topMargin: -35
        anchors.right: parent.right
        anchors.rightMargin: -134
        rotation: 45

        Image {
            id: image
            x: 95
            anchors.top: parent.top
            anchors.topMargin: 117
            anchors.right: parent.right
            anchors.rightMargin: 110
            source: "appIcon/logo-nettruyen.png"
            fillMode: Image.PreserveAspectFit

        }
    }

}
