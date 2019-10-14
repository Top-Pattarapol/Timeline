import XCTest
@testable import timeline

class RequestAPITests: XCTestCase {

  func testAlbumsRequest() {
    let request = AlbumsRequest()

    XCTAssertEqual(HTTPMethod.get, request.method)
    XCTAssertEqual("/public-api/albums", request.url)
  }

  func testPhotosRequest() {
    let request = PhotosRequest(albumId: "1")
    XCTAssertEqual(HTTPMethod.get, request.method)
    XCTAssertEqual("/public-api/photos", request.url)
    XCTAssertEqual("1", request.body["album_id"] as? String)
  }
}
