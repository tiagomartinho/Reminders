@testable import RemindersCore
import XCTest

class RemindersPresenterTest: XCTestCase {

    func testShowNoRemindersWhenNoRemindersArePresent() {
        let view = SpyRemindersView()
        let router = SpyRouter()
        let repository = MockRemindersRepository()
        repository.reminders = []
        let presenter = RemindersPresenter(view: view,
                                           router: router,
                                           repository: repository)

        presenter.loadReminders()

        XCTAssert(view.showNoRemindersWasCalled)
    }

    func testShowRemindersWhenRemindersArePresent() {
        let view = SpyRemindersView()
        let router = SpyRouter()
        let repository = MockRemindersRepository()
        let reminders = [Reminder(title: "Read Clean Architecture")]
        repository.reminders = reminders
        let presenter = RemindersPresenter(view: view,
                                           router: router,
                                           repository: repository)

        presenter.loadReminders()

        XCTAssert(view.showRemindersWasCalled)
        XCTAssertEqual(reminders, view.remindersShown)
    }

    func testRouteToAddReminderView() {
        let view = SpyRemindersView()
        let router = SpyRouter()
        let repository = MockRemindersRepository()
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
        let repository = MockRemindersRepository()
        let presenter = RemindersPresenter(view: view,
                                           router: router,
                                           repository: repository)

        presenter.loadReminders()

        XCTAssert(repository.loadWasCalled)
    }
}
