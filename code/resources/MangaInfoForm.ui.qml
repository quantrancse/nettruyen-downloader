import QtQuick 2.4
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.3

PageBackground {
    id: mangaInfoPage
    width: 1200
    height: 558
    property alias backButton: backButton
    property alias discriptionText: discriptionText
    property alias authorName: authorName
    property alias categoriesName: categoriesName
    property alias viewedName: viewedName
    property alias lastUpdatedName: lastUpdatedName
    property alias lastChapterName: lastChapterName
    property alias mangaName: mangaName
    property alias mangaThumbnail: mangaThumbnail

    Rectangle {
        id: decriptionBox
        x: 452
        y: 396
        width: 696
        height: 145
        color: "#673ab7"

        ScrollView {
            id: view
            font.family: "Verdana"
            hoverEnabled: true
            enabled: true
            anchors.fill: parent
            wheelEnabled: true

            TextArea {
                id: discriptionText
                font.pointSize: 10
                font.family: "Verdana"
                wrapMode: Text.WordWrap
                color: "white"
                activeFocusOnPress: false
            }
        }
    }

    Image {
        id: mangaThumbnail
        x: 75
        y: 99
        width: 200
        height: 300
        fillMode: Image.PreserveAspectFit
        source: ""

        Rectangle {
            id: rectangle
            x: 380
            y: 433
            width: 711
            height: 19
            color: "#673ab7"
        }
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

    Rectangle {
        id: infoBox
        x: 452
        y: 99
        width: 491
        height: 291
        color: "#673ab7"

        Rectangle {
            id: infoSubBox
            y: 228
            width: 600
            color: "#673ab7"
            anchors.bottom: descriptionLabel.top
            anchors.left: parent.left
            anchors.top: categoriesName.bottom
            anchors.topMargin: 30

            ColumnLayout {
                id: infoLabelLayout
                width: 200
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                anchors.top: parent.top

                Label {
                    id: viewedLabel
                    x: 0
                    y: 107
                    color: "#ffc107"
                    text: qsTr("Viewed:")
                    font.pointSize: 11
                    Layout.alignment: Qt.AlignLeft | Qt.AlignTop
                    font.family: "Verdana"
                    font.bold: true
                    anchors.leftMargin: -456

                    Image {
                        id: viewedIcon
                        x: -35
                        y: 105
                        width: 22
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.topMargin: 0
                        fillMode: Image.PreserveAspectFit
                        source: "mangaInfo/baseline_remove_red_eye_white_18dp.png"
                    }
                }

                Label {
                    id: lastUpdatedLabel
                    x: 0
                    y: 160
                    color: "#ffc107"
                    text: qsTr("Last Updated:")
                    font.pointSize: 11
                    Layout.alignment: Qt.AlignLeft | Qt.AlignTop
                    font.family: "Verdana"
                    anchors.leftMargin: -456
                    font.bold: true

                    Image {
                        id: lastUpdatedIcon
                        x: -35
                        y: 12
                        width: 22
                        anchors.verticalCenter: lastUpdatedLabel.verticalCenter
                        fillMode: Image.PreserveAspectFit
                        source: "mangaInfo/baseline_calendar_today_white_18dp.png"
                    }
                }

                Label {
                    id: lastChapterLabel
                    x: 0
                    y: 205
                    color: "#ffc107"
                    text: qsTr("Last Chapter:")
                    font.pointSize: 11
                    Layout.alignment: Qt.AlignLeft | Qt.AlignTop
                    font.family: "Verdana"
                    font.bold: true
                    anchors.leftMargin: -456

                    Image {
                        id: lastChapterIcon
                        x: -35
                        y: 1
                        width: 22
                        anchors.verticalCenter: parent.verticalCenter
                        fillMode: Image.PreserveAspectFit
                        source: "mangaInfo/baseline_book_white_18dp.png"
                    }
                }
            }

            ColumnLayout {
                id: infoNameLayout
                x: 32
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.top: parent.top
                anchors.left: infoLabelLayout.right

                Label {
                    id: viewedName
                    x: 0
                    y: 107
                    color: "#ffffff"
                    text: qsTr("")
                    anchors.leftMargin: -456
                    font.pointSize: 11
                    font.bold: true
                    font.family: "Verdana"
                    Layout.alignment: Qt.AlignLeft | Qt.AlignTop
                }

                Label {
                    id: lastUpdatedName
                    x: 0
                    y: 160
                    color: "#ffffff"
                    text: qsTr("")
                    anchors.leftMargin: -456
                    font.pointSize: 11
                    font.bold: true
                    font.family: "Verdana"
                    Layout.alignment: Qt.AlignLeft | Qt.AlignTop
                }

                Label {
                    id: lastChapterName
                    x: 0
                    y: 205
                    color: "#ffffff"
                    text: qsTr("")
                    anchors.leftMargin: -456
                    font.pointSize: 11
                    font.bold: true
                    font.family: "Verdana"
                    Layout.alignment: Qt.AlignLeft | Qt.AlignTop
                }
            }
        }

        Label {
            id: categoriesName
            y: 56
            width: 400
            color: "#ffffff"
            text: qsTr("")
            anchors.left: categoriesLabel.right
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            font.pointSize: 11
            font.bold: true
            font.family: "Verdana"
        }

        Label {
            id: authorName
            x: 502
            width: 400
            height: 31
            color: "#ffffff"
            text: qsTr("")
            anchors.top: parent.top
            anchors.left: authorLabel.right
            font.bold: true
            font.pointSize: 11
            font.family: "Verdana"
            fontSizeMode: Text.HorizontalFit
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
        }

        Label {
            id: categoriesLabel
            width: 200
            height: 22
            color: "#ffc107"
            text: qsTr("Categories:")
            anchors.top: categoriesName.top
            anchors.left: parent.left
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
            font.pointSize: 11
            font.family: "Verdana"
            font.bold: true
        }

        Label {
            id: authorLabel
            width: 200
            height: 22
            color: "#ffc107"
            text: qsTr("Author:")
            anchors.top: parent.top
            anchors.left: parent.left
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
            fontSizeMode: Text.HorizontalFit
            font.bold: true
            font.pointSize: 11
            font.family: "Verdana"
        }

        Label {
            id: descriptionLabel
            y: -115
            width: 200
            height: 23
            color: "#ffc107"
            text: qsTr("Description:")
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 8
            font.bold: true
            font.pointSize: 11
            font.family: "Verdana"
            fontSizeMode: Text.HorizontalFit
            Layout.alignment: Qt.AlignLeft | Qt.AlignTop
        }

        Image {
            id: descriptionIcon
            x: -35
            y: 260
            width: 22
            anchors.verticalCenter: descriptionLabel.verticalCenter
            fillMode: Image.PreserveAspectFit
            source: "mangaInfo/baseline_description_white_18dp.png"
        }

        Image {
            id: categoriesIcon
            x: -35
            y: 56
            height: 22
            anchors.verticalCenter: categoriesLabel.verticalCenter
            fillMode: Image.PreserveAspectFit
            source: "mangaInfo/baseline_collections_bookmark_white_18dp.png"
        }

        Image {
            id: authorIcon
            x: -35
            y: 0
            height: 22
            anchors.right: authorLabel.left
            anchors.rightMargin: 13
            fillMode: Image.PreserveAspectFit
            source: "mangaInfo/baseline_person_white_18dp.png"
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
    }
}

