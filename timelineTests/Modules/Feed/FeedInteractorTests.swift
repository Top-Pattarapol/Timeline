import XCTest
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
      XCTAssertEqual("1", self.presenter?.data?.albums.result[0].id)
      XCTAssertEqual("1054", self.presenter?.data?.albums.result[0].userID)
      XCTAssertEqual("Similique et facilis repellat.", self.presenter?.data?.albums.result[0].title)
    }
  }
}

//func getPhoto(request: Feed.Photo.Request)
//func setDataPostView(request: Feed.Post.Request)
//func getSearchList(request: Feed.Search.Request)
