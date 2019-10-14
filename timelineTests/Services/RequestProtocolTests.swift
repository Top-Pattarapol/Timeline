import XCTest
@testable import timeline
import Alamofire

class RequestProtocolTests: XCTestCase {

  struct DummyRequest: RequestProtocol {
    let url = "/test"
    typealias ResponseType = Bool
  }

  func testDummyRequest() {
    let request = DummyRequest()

    XCTAssertEqual(HTTPMethod.get, request.method)
    XCTAssertEqual("/test", request.url)
    XCTAssertEqual(0, request.headers.count)
    XCTAssertEqual(0, request.body.count)
  }
}
