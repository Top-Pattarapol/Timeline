import XCTest

class PostTest: XCTestCase {

  let app = XCUIApplication()

  override func setUp() {
    continueAfterFailure = false
  }

  func testPost() {
    app.launch()
    app.tables.cells.firstMatch.tap()
    app.buttons.element(boundBy: 2).tap()
    app.tap()
    app.buttons.element(boundBy: 3).tap()
    app.tap()
    app.buttons.element(boundBy: 4).tap()
    app.tap()
  }
}
