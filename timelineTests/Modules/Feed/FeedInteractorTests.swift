import XCTest
import Foundation
@testable import timeline

class FeedInteractorTests: XCTestCase {

  var interactor = FeedInteractor()
  var presenter: SpyFeedPresenter?

  override func setUp() {
    let expect = expectation(description: "feedTest")
    presenter = SpyFeedPresenter(expect: expect)
    interactor.presenter = presenter
  }

  func testGetAlbums() {
    Stubs.methodPostResponseWithData(json: [
      "_meta": [
        "success": true,
        "code": 200,
        "message": "OK. Everything worked as expected.",
        "totalCount": 3240,
        "pageCount": 162,
        "currentPage": 1,
        "perPage": 20,
        "rateLimit": [
          "limit": 30,
          "remaining": 29,
          "reset": 2
        ]
      ],
      "result": [
        [
          "id": "1",
          "user_id": "1054",
          "title": "Similique et facilis repellat.",
          "_links": [
            "self": [
              "href": "https://gorest.co.in/public-api/albums/1"
            ],
            "edit": [
              "href": "https://gorest.co.in/public-api/albums/1"
            ]
          ]
        ]
      ]
    ])
    interactor.getAlbums(request: Feed.AlbumFeed.Request())
    waitForExpectations(timeout: 3) { (_) in
      XCTAssertEqual("1", self.presenter?.dataFeed?.albums.result[0].id)
      XCTAssertEqual("1054", self.presenter?.dataFeed?.albums.result[0].userID)
      XCTAssertEqual("Similique et facilis repellat.", self.presenter?.dataFeed?.albums.result[0].title)
    }
  }

  func testGetPhotos() {
    Stubs.methodPostResponseWithData(json: [
      "_meta": [
        "success": true,
        "code": 200,
        "message": "OK. Everything worked as expected.",
        "totalCount": 1329,
        "pageCount": 67,
        "currentPage": 1,
        "perPage": 20,
        "rateLimit": [
          "limit": 30,
          "remaining": 29,
          "reset": 2
        ]
      ],
      "result": [
        [
          "id": "2",
          "album_id": "1609",
          "title": "Et a assumenda at cum eveniet numquam. Ad est laboriosam ut veritatis quisquam atque non iste.",
          "url": "https://lorempixel.com/1024/768/abstract/?41004",
          "thumbnail": "https://lorempixel.com/150/150/abstract/?53717",
          "_links": [
            "self": [
              "href": "https://gorest.co.in/public-api/photos/2"
            ],
            "edit": [
              "href": "https://gorest.co.in/public-api/photos/2"
            ]
          ]
        ]
      ]
    ])
    interactor.getPhoto(request: Feed.Photo.Request(id: "1", indexPath: IndexPath.init(row: 1, section: 1)))
    waitForExpectations(timeout: 3) { (_) in
      XCTAssertEqual("2", self.presenter?.dataPhoto?.photo.result[0].id)
      XCTAssertEqual("1609", self.presenter?.dataPhoto?.photo.result[0].albumID)
      XCTAssertEqual("Et a assumenda at cum eveniet numquam. Ad est laboriosam ut veritatis quisquam atque non iste.", self.presenter?.dataPhoto?.photo.result[0].title)
      XCTAssertEqual("https://lorempixel.com/1024/768/abstract/?41004", self.presenter?.dataPhoto?.photo.result[0].url)
      XCTAssertEqual(IndexPath(row: 1, section: 1), self.presenter?.dataPhoto?.indexPath)
    }
  }

  func testSetDataPostView() {
    let links = Links(linksSelf: .init(href: "0"), edit: .init(href: "0"))
    let album = Album.init(id: "0", userID: "0", title: "test", links: links, photos: nil)
    interactor.albums = Albums.init(result: [album])
    interactor.setDataPostView(request: Feed.Post.Request(id: "0", time: "123"))

    waitForExpectations(timeout: 3) { (_) in
      XCTAssertEqual(1, self.presenter?.presentPostViewPass)
      XCTAssertEqual(album.id, self.interactor.dataForPostView?.id)
      XCTAssertEqual(album.title, self.interactor.dataForPostView?.title)
    }
  }

  func testGetSearchList() {
    interactor.getSearchList(request: Feed.Search.Request.init(data: "test"))
    waitForExpectations(timeout: 3) { (_) in
      XCTAssertEqual("test", self.presenter?.dataSearch)
    }
  }
}
