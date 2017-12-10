import XCTest
@testable import RemindersCore

class RemindersPresenterTest: XCTestCase {

    func testShowNoRemindersWhenNoRemindersArePresent() {
        let view = SpyRemindersView()
        let router = SpyRouter()
        let presenter = RemindersPresenter(view: view, router: router)

        presenter.loadReminders()

        XCTAssert(view.showNoRemindersWasCalled)
    }

    func testRouteToAddReminderView() {
        let view = SpyRemindersView()
        let router = SpyRouter()
        let presenter = RemindersPresenter(view: view, router: router)

        presenter.addNewReminder()

        XCTAssert(router.routeWasCalled)
        XCTAssertEqual(.addReminder, router.lastView)
    }
}
