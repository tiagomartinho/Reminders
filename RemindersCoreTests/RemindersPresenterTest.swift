import XCTest
@testable import RemindersCore

class RemindersPresenterTest: XCTestCase {

    func testShowNoRemindersWhenNoRemindersArePresent() {
        let view = SpyRemindersView()
        let presenter = RemindersPresenter(view: view)

        presenter.loadReminders()

        XCTAssert(view.showNoRemindersWasCalled)
    }
}
