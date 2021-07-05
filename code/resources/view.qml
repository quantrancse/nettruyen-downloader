import QtQuick 2.4
import QtQuick.Controls 2.13
import QtQuick.Controls.Material 2.12

ApplicationWindow {
    id: applicationWindow
    visible: true
    width: 1200
    height: 600
    minimumWidth: 1200
    minimumHeight: 600
    maximumHeight: minimumHeight
    maximumWidth: minimumWidth
    title: qsTr("Nettruyen Downloader")
    Material.theme: Material.Light
    Material.accent: Material.Amber

    Loader {
        id: pageLoader
        anchors.fill: parent
        source: "HomePage.qml"
    }
}

