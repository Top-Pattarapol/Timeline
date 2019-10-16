import XCTest
@testable import timeline

class PostInteractorTests: XCTestCase {

  var interactor = PostInteractor()
  var presenter: SpyPostPresenter?

  override func setUp() {
    let expect = expectation(description: "postTest")
    presenter = SpyPostPresenter(expect: expect)
    interactor.presenter = presenter
  }

  func testGetPost() {
    interactor.data = .init(id: "1", title: "test", date: Date(), imageType: .image, urlList: nil, imageList: nil)
    interactor.getPost(request: Post.Post.Request())

    waitForExpectations(timeout: 3) { (_) in
      XCTAssertEqual("1", self.presenter?.responsePresentPost?.data.id)
      XCTAssertEqual("test", self.presenter?.responsePresentPost?.data.title)
      XCTAssertNil(self.presenter?.responsePresentPost?.data.urlList)
      XCTAssertNil(self.presenter?.responsePresentPost?.data.imageList)
    }
  }

  func testGetFullImage() {
    interactor.getFullImage(request: Post.FullImage.Request(image: nil))

    waitForExpectations(timeout: 3) { (_) in
      XCTAssertNil(self.presenter?.responsePresentFullImage?.image)
    }
  }

}
