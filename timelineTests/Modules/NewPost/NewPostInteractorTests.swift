import XCTest
@testable import timeline

class NewPostInteractorTests: XCTestCase {

  var interactor = NewPostInteractor()
  var presenter: SpyNewPostPresenter?

  override func setUp() {
    let expect = expectation(description: "NewPostInteractorTest")
    presenter = SpyNewPostPresenter(expect: expect)
    interactor.presenter = presenter
  }

  func testSetNewPost() {
    interactor.setNewPost(request: NewPost.NewPost.Request(text: "test", image1: nil, image2: nil, image3: nil))

    waitForExpectations(timeout: 3) { (_) in
      XCTAssertEqual(1, self.presenter?.responseNewPostPass)
    }
  }

}
