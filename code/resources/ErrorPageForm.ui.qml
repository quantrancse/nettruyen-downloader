import QtQuick 2.4
import QtQuick.Controls 2.13

PageBackground {
    id: errorPage
    width: 1200
    height: 600
    property alias backButton: backButton

    Label {
        id: label
        x: 335
        y: 191
        width: 458
        height: 112
        color: "#ffffff"
        text: qsTr("Sorry! Page not found....")
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pointSize: 21
        font.family: "Verdana"
    }

    RoundButton {
        id: backButton
        x: 550
        width: 208
        height: 70
        radius: 5
        text: qsTr("BACK")
        anchors.top: label.bottom
        anchors.topMargin: 90
        highlighted: true
        anchors.horizontalCenter: label.horizontalCenter
        font.bold: true
        font.pointSize: 14
        font.family: "Verdana"
    }
}
