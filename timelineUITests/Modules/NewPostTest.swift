import XCTest

class NewPostTest: XCTestCase {

  let app = XCUIApplication()

  override func setUp() {
    continueAfterFailure = true
    app.launch()
  }

  func testNoImage() {
    sleep(1)
    app.buttons.firstMatch.tap()
    let textViews = app.textViews.firstMatch
    textViews.tap()
    textViews.typeText("testNoImage")
    app.tap()
    sleep(1)
    app.buttons["Create"].firstMatch.tap()
  }

  func testOneImage() {
    sleep(1)
    app.buttons.firstMatch.tap()
    let textViews = app.textViews.firstMatch
    textViews.tap()
    textViews.typeText("testOneImage")
    app.tap()

    app.buttons["plus"].tap()
    app.buttons["Camera roll"].tap()
    sleep(1)
    app.cells.element(boundBy: 0).tap()
    sleep(1)
    app.buttons["Choose"].tap()

    sleep(1)
    app.buttons["Create"].firstMatch.tap()
  }

  func testTwoImage() {
    sleep(1)
    app.buttons.firstMatch.tap()
    let textViews = app.textViews.firstMatch
    textViews.tap()
    textViews.typeText("testTwoImage")
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

    sleep(1)
    app.buttons["Create"].firstMatch.tap()
  }

  func testThreeImage() {
    sleep(1)
    app.buttons.firstMatch.tap()
    let textViews = app.textViews.firstMatch
    textViews.tap()
    textViews.typeText("testThreeImage")
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
