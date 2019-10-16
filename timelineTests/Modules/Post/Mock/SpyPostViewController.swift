import XCTest
@testable import timeline

class SpyPostViewController: PostDisplayLogic {

  let expect: XCTestExpectation?
  var viewModelDisplayPost: Post.Post.ViewModel?
  var viewModelDisplayFullImage: Post.FullImage.ViewModel?

  init(expect: XCTestExpectation? = nil) {
    self.expect = expect
  }
  
  func displayPost(viewModel: Post.Post.ViewModel) {
    viewModelDisplayPost = viewModel
    expect?.fulfill()
  }

  func displayFullImage(viewModel: Post.FullImage.ViewModel) {
    viewModelDisplayFullImage = viewModel
    expect?.fulfill()
  }


}
