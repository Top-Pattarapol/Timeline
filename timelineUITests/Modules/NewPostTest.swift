import XCTest

class NewPostTest: XCTestCase {

  let app = XCUIApplication()

  override func setUp() {
    continueAfterFailure = false
  }

  func testNewPost() {
    app.launch()
    app.buttons.firstMatch.tap()
    let textViews = app.textViews.firstMatch
    textViews.tap()
    textViews.typeText("test")
    app.tap()

    app.buttons["plus"].tap()
    app.buttons["Camera roll"].tap()
    app.cells.element(boundBy: 0).tap()
    app.buttons["Choose"].tap()

    app.buttons["plus"].tap()
    app.buttons["Camera roll"].tap()
    app.cells.element(boundBy: 1).tap()
    app.buttons["Choose"].tap()

    app.buttons["plus"].tap()
    app.buttons["Camera roll"].tap()
    app.cells.element(boundBy: 2).tap()
    app.buttons["Choose"].tap()
  }
}
