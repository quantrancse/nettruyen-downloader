import QtQuick 2.4

HomePageForm {
    searchButton.onClicked: {
        pageLoader.source = con.check_valid_url(link.text)
    }

    authorLink.onClicked: {
        Qt.openUrlExternally("https://quantrancse.github.io");
    }
}

