import XCTest

class FeedTest: XCTestCase {

  let app = XCUIApplication()

  override func setUp() {
    continueAfterFailure = false
    app.launch()
  }

  func testFeed() {
    let table = app.tables.firstMatch
    table.swipeUp()
    table.swipeDown()

    let cell = table.cells.firstMatch
    cell.tap()
  }

  func testSearch() {
    let searchFields = app.searchFields.firstMatch
    searchFields.tap()
    searchFields.typeText("test")
  }
}
