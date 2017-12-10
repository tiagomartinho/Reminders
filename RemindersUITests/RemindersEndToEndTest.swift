import XCTest

class RemindersEndToEndTest: XCTestCase {

    let app = XCUIApplication()

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()
    }

    func testShowNoReminders() {
        assertNoReminders()
        addReminder()
        assertReminderIsPresent()
    }

    private func assertNoReminders() {
        let noRemindersLabel = app.staticTexts["You have no reminders"]
        XCTAssert(noRemindersLabel.exists)
    }

    private func addReminder() {
        app.navigationBars["Reminders"].buttons["Add"].tap()
        let titleTextField = app.textFields["Title"]
        titleTextField.tap()
        titleTextField.typeText("Read Clean Architecture")
        app.navigationBars["Add Reminder"].buttons["Save"].tap()
    }

    private func assertReminderIsPresent() {
        let table = app.tables["Reminders"]
        XCTAssert(table.exists)
        XCTAssertEqual(1, table.cells.count)
        XCTAssert(table.cells.staticTexts["Read Clean Architecture"].exists)
    }
}
