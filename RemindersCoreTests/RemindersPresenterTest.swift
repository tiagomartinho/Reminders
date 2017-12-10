import XCTest
@testable import RemindersCore

class RemindersPresenterTest: XCTestCase {

    func testShowNoRemindersWhenNoRemindersArePresent() {
        let view = SpyRemindersView()
        let presenter = RemindersPresenter(view: view)

        presenter.loadReminders()

        XCTAssert(view.showNoRemindersWasCalled)
    }

    func testShowAddReminders() {
        let view = SpyRemindersView()
        let presenter = RemindersPresenter(view: view)

        presenter.addNewReminder()

        XCTAssert(view.showAddReminderWasCalled)
    }
}
