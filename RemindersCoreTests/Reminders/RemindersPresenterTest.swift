import XCTest
@testable import RemindersCore

class RemindersPresenterTest: XCTestCase {

    func testShowNoRemindersWhenNoRemindersArePresent() {
        let view = SpyRemindersView()
        let router = SpyRouter()
        let repository = SpyRemindersRepository()
        let presenter = RemindersPresenter(view: view,
                                           router: router,
                                           repository: repository)

        presenter.loadReminders()

        XCTAssert(view.showNoRemindersWasCalled)
    }

    func testRouteToAddReminderView() {
        let view = SpyRemindersView()
        let router = SpyRouter()
        let repository = SpyRemindersRepository()
        let presenter = RemindersPresenter(view: view,
                                           router: router,
                                           repository: repository)

        presenter.addNewReminder()

        XCTAssert(router.routeWasCalled)
        XCTAssertEqual(.addReminder, router.lastView)
    }

    func testLoadRemindersFromRemindersRepository() {
        let view = SpyRemindersView()
        let router = SpyRouter()
        let repository = SpyRemindersRepository()
        let presenter = RemindersPresenter(view: view,
                                           router: router,
                                           repository: repository)

        presenter.loadReminders()

        XCTAssert(repository.loadWasCalled)
    }
}
