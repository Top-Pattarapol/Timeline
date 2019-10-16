import XCTest
@testable import timeline

class SpyNewPostPresenter: NewPostPresentationLogic {

  let expect: XCTestExpectation?
  var responseNewPostPass = 0

  init(expect: XCTestExpectation? = nil) {
    self.expect = expect
  }

  func presentNewPost(response: NewPost.NewPost.Response) {
    responseNewPostPass += 1
    expect?.fulfill()
  }

}
