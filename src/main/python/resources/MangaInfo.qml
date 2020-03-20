import QtQuick 2.4

MangaInfoForm {
    Component.onCompleted: {
        mangaThumbnail.source = con.getMangaThumbnail()
        mangaName.text = con.getMangaName()
        authorName.text = con.getMangaAuthor()
        categoriesName.text = con.getMangaCategories()
        viewedName.text = con.getMangaViewed()
        lastUpdatedName.text = con.getMangaLastUpdated()
        lastChapterName.text = con.getMangaLastChapter()
        discriptionText.text = con.getMangaDescription()
    }

    backButton.onClicked: {
        pageLoader.source = "HomePage.qml"
    }
}
