import XCTest

class RemindersEndToEndTest: XCTestCase {
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    func testShowNoReminders() {
        let noRemindersLabel = XCUIApplication().staticTexts["You have no reminders"]
        XCTAssert(noRemindersLabel.exists)
    }
}
