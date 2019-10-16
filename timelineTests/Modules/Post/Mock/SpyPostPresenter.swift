import XCTest
@testable import timeline

class SpyPostPresenter: PostPresentationLogic {

  let expect: XCTestExpectation?
  var responsePresentPost: Post.Post.Response?
  var responsePresentFullImage: Post.FullImage.Response?

  init(expect: XCTestExpectation? = nil) {
    self.expect = expect
  }

  func presentPost(response: Post.Post.Response) {
    responsePresentPost = response
    expect?.fulfill()
  }

  func presentFullImage(response: Post.FullImage.Response) {
    responsePresentFullImage = response
    expect?.fulfill()
  }

}
