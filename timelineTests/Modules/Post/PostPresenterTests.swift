import XCTest
@testable import timeline

class PostPresenterTests: XCTestCase {

  var presenter = PostPresenter()
  var viewController: SpyPostViewController?

  override func setUp() {
    let expect = expectation(description: "PostPresenterTests")
    viewController = SpyPostViewController(expect: expect)
    presenter.viewController = viewController
  }


  func testPresentPost() {
    let response = Post.Post.Response.init(data: .init(id: "1", title: "test", date: Date(), imageType: .image, urlList: nil, imageList: nil))
    presenter.presentPost(response: response)

    waitForExpectations(timeout: 3) { (_) in
      XCTAssertEqual("1", self.viewController?.viewModelDisplayPost?.data.id)
      XCTAssertEqual("test", self.viewController?.viewModelDisplayPost?.data.title)
      XCTAssertNil(self.viewController?.viewModelDisplayPost?.data.urlList)
      XCTAssertNil(self.viewController?.viewModelDisplayPost?.data.imageList)
    }
  }

  func testPresentFullImage() {
    presenter.presentFullImage(response: Post.FullImage.Response.init(image: nil))
    waitForExpectations(timeout: 3) { (_) in
      XCTAssertNil(self.viewController?.viewModelDisplayFullImage?.image)
    }
  }
}
