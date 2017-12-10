import XCTest
@testable import RemindersCore

class AddReminderPresenterTest: XCTestCase {

    func testRouteToRemindersViewWithCancel() {
        let router = SpyRouter()
        let presenter = AddReminderPresenter(router: router)

        presenter.cancel()

        XCTAssert(router.routeWasCalled)
        XCTAssertEqual(.reminders, router.lastView)
    }
}
