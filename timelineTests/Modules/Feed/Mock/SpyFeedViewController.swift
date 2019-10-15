import XCTest
@testable import timeline

class SpyFeedViewController: FeedDisplayLogic {

  let expect: XCTestExpectation?
  var viewModelFeed: Feed.AlbumFeed.ViewModel?
  var viewModelPhoto: Feed.Photo.ViewModel?
  var routeToPostPass = 0
  var viewModelSearch: Feed.Search.ViewModel?


  init(expect: XCTestExpectation? = nil) {
    self.expect = expect
  }

  func displayFeed(viewModel: Feed.AlbumFeed.ViewModel) {
    viewModelFeed = viewModel
    expect?.fulfill()
  }

  func displayPhoto(viewModel: Feed.Photo.ViewModel) {
    viewModelPhoto = viewModel
    expect?.fulfill()
  }

  func routeToPost(viewModel: Feed.Post.ViewModel) {
    routeToPostPass += 1
    expect?.fulfill()
  }

  func displaySearch(viewModel: Feed.Search.ViewModel) {
    viewModelSearch = viewModel
    expect?.fulfill()
  }

}
