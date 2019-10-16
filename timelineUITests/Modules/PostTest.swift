import XCTest

class PostTest: XCTestCase {

  let app = XCUIApplication()

  override func setUp() {
    continueAfterFailure = false
    app.launch()
  }

  func testPost() {

    app.tables.cells.firstMatch.tap()
    app.buttons.element(boundBy: 2).tap()
    app.tap()
    app.buttons.element(boundBy: 3).tap()
    app.tap()
    app.buttons.element(boundBy: 4).tap()
    app.tap()
  }
}
