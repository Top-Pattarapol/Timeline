import XCTest
@testable import timeline

class WebServiceTests: XCTestCase {

    func testWebService() {
      let webService = WebService(baseURL: "https://google.com")
      XCTAssertEqual("https://google.com", webService.baseURL)

      let webServiceWithHeader = WebService(baseURL: "https://google.com", baseHeaders: ["Test":"Test"])
      XCTAssertEqual("https://google.com", webServiceWithHeader.baseURL)
      XCTAssertEqual(["Test":"Test"], webServiceWithHeader.baseHeaders)

      let webServiceGorest = WebService(host: .Gorest)
      XCTAssertEqual("https://gorest.co.in", webServiceGorest.baseURL)
      XCTAssertEqual(["Authorization": "Bearer d3wjvB4clXkOAUmfKQSG5U54ERD9Ncp60C04",], webServiceGorest.baseHeaders)
    }
}
