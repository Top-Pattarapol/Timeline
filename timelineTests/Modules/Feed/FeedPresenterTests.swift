import XCTest
@testable import timeline

class FeedPresenterTests: XCTestCase {

  var presenter = FeedPresenter()
  var viewController: SpyFeedViewController?

  override func setUp() {
    let expect = expectation(description: "FeedPresenterTests")
    viewController = SpyFeedViewController(expect: expect)
    presenter.viewController = viewController
  }

  func testPresentFeed() {
    let links = Links(linksSelf: .init(href: "0"), edit: .init(href: "0"))
    let album = Album.init(id: "0", userID: "0", title: "test", links: links, photos: nil)
    let albums = Albums.init(result: [album])
    presenter.presentFeed(response: Feed.AlbumFeed.Response(albums: albums))

    waitForExpectations(timeout: 3) { (_) in
      XCTAssertEqual("0", self.viewController?.viewModelFeed?.data[0].id)
      XCTAssertEqual("test", self.viewController?.viewModelFeed?.data[0].title)
    }
  }

  func testPresentPhoto() {
    
    let newFeed = PresentModel.init(id: "0", title: "test", date: Date(), imageType: .url(isLoad: true), urlList: nil, imageList: nil)
    presenter.feedData = [newFeed]
    let links = Links(linksSelf: .init(href: "0"), edit: .init(href: "0"))
    let photo = Photo.init(id: "0", albumID: "0", title: "test1", url: "test2", thumbnail: "test3", links: links)
    let photos = Photos.init(result: [photo])
    presenter.presentPhoto(response: .init(id: "0", photo: photos, indexPath: IndexPath.init(row: 0, section: 0)))

    waitForExpectations(timeout: 3) { (_) in
      XCTAssertEqual("0", self.viewController?.viewModelPhoto?.data[0].id)
      XCTAssertEqual("test", self.viewController?.viewModelPhoto?.data[0].title)
      XCTAssertEqual("test2", self.viewController?.viewModelPhoto?.data[0].urlList?[0])
    }
  }

  func testPresentPostView() {
    let response = Feed.Post.Response()
    presenter.presentPostView(response: response)
    waitForExpectations(timeout: 3) { (_) in
      XCTAssertEqual(1, self.viewController?.routeToPostPass)
    }
  }

  func testPresentSearch() {
    let newFeed = PresentModel.init(id: "0", title: "test", date: Date(), imageType: .url(isLoad: true), urlList: nil, imageList: nil)
    presenter.feedData = [newFeed]
    let links = Links(linksSelf: .init(href: "0"), edit: .init(href: "0"))
    let photo = Photo.init(id: "0", albumID: "0", title: "test1", url: "test2", thumbnail: "test3", links: links)
    let photos = Photos.init(result: [photo])
    let response = Feed.Search.Response(data: "test")
    presenter.presentSearch(response: response)

    waitForExpectations(timeout: 3) { (_) in
      XCTAssertEqual(false, self.viewController?.viewModelSearch?.data.isEmpty)
      XCTAssertEqual("0", self.viewController?.viewModelSearch?.data[0].id)
      XCTAssertEqual("test", self.viewController?.viewModelSearch?.data[0].title)
    }
  }
}
