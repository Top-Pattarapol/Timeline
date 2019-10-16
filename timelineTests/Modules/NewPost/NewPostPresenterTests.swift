import XCTest
@testable import timeline

class NewPostPresenterTests: XCTestCase {

  var presenter = NewPostPresenter()
  var viewController: SpyNewPostViewController?

  override func setUp() {
    let expect = expectation(description: "NewPostPresenterTest")
    viewController = SpyNewPostViewController(expect: expect)
    presenter.viewController = viewController
  }

  func testPresentNewPost() {
    presenter.presentNewPost(response: .init())

    waitForExpectations(timeout: 3) { (_) in
      XCTAssertEqual(1, self.viewController?.viewModelNewPostPass)
    }
  }


}
