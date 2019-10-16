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
    sleep(1)
    app.cells.element(boundBy: 0).tap()
    sleep(1)
    app.buttons["Choose"].tap()

    app.buttons["plus"].tap()
    app.buttons["Camera roll"].tap()
    sleep(1)
    app.cells.element(boundBy: 1).tap()
    sleep(1)
    app.buttons["Choose"].tap()

    app.buttons["plus"].tap()
    app.buttons["Camera roll"].tap()
    sleep(1)
    app.cells.element(boundBy: 2).tap()
    sleep(1)
    app.buttons["Choose"].tap()

    sleep(1)
    app.buttons["Create"].firstMatch.tap()
  }
}
