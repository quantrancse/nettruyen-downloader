import QtQuick 2.4

MangaInfoForm {
    Component.onCompleted: {
        mangaThumbnail.source = con.get_manga_thumbnail()
        mangaName.text = con.getMangaName()
        authorName.text = con.get_manga_author()
        categoriesName.text = con.get_manga_categories()
        viewedName.text = con.get_manga_viewed()
        lastUpdatedName.text = con.get_manga_last_updated()
        lastChapterName.text = con.get_manga_last_chapter()
        discriptionText.text = con.get_manga_description()
    }

    backButton.onClicked: {
        pageLoader.source = "HomePage.qml"
    }
}
