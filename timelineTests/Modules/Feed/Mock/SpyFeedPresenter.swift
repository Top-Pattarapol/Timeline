import XCTest
@testable import timeline

class SpyFeedPresenter: FeedPresentationLogic {

  let expect: XCTestExpectation?
  var data: Feed.AlbumFeed.Response?

  init(expect: XCTestExpectation? = nil) {
      self.expect = expect
  }

  func presentFeed(response: Feed.AlbumFeed.Response) {
    data = response
    expect?.fulfill()
  }

  func presentPhoto(response: Feed.Photo.Response) {

  }

  func presentPostView(response: Feed.Post.Response) {

  }

  func presentSearch(response: Feed.Search.Response) {
    
  }
}
