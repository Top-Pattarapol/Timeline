import XCTest
@testable import timeline

class SpyNewPostViewController: NewPostDisplayLogic {

  let expect: XCTestExpectation?
  var viewModelNewPostPass = 0


  init(expect: XCTestExpectation? = nil) {
    self.expect = expect
  }

  func routeToParent(viewModel: NewPost.NewPost.ViewModel) {
    viewModelNewPostPass += 1
    expect?.fulfill()
  }

}
