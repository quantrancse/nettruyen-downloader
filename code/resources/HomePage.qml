import QtQuick 2.4

HomePageForm {
    searchButton.onClicked: {
        pageLoader.source = con.check_valid_url(link.text)
    }

    nettruyenLink.onClicked: {
        Qt.openUrlExternally("http://www.nettruyenvip.com");
    }

    authorLink.onClicked: {
        Qt.openUrlExternally("https://github.com/quantrancse");
    }
}

