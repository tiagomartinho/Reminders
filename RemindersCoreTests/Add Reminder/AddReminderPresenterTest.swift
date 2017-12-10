@testable import RemindersCore
import XCTest

class AddReminderPresenterTest: XCTestCase {

    func testSaveReminderToRepository() {
        let reminderTitle = "Read Clean Architecture"
        let reminder = Reminder(title: reminderTitle)
        let view = MockAddReminderView()
        view.reminderTitle = reminderTitle
        let router = SpyRouter()
        let repository = MockRemindersRepository()
        let presenter = AddReminderPresenter(view: view,
                                             router: router,
                                             repository: repository)

        presenter.save()

        XCTAssert(repository.saveWasCalled)
        XCTAssertEqual(reminder, repository.lastReminder)
    }

    func testRouteToRemindersViewWithCancel() {
        let view = MockAddReminderView()
        let router = SpyRouter()
        let repository = MockRemindersRepository()
        let presenter = AddReminderPresenter(view: view,
                                             router: router,
                                             repository: repository)

        presenter.cancel()

        XCTAssert(router.routeWasCalled)
        XCTAssertEqual(.reminders, router.lastView)
    }

    func testRouteToRemindersViewWithSave() {
        let view = MockAddReminderView()
        let router = SpyRouter()
        let repository = MockRemindersRepository()
        let presenter = AddReminderPresenter(view: view,
                                             router: router,
                                             repository: repository)

        presenter.save()

        XCTAssert(router.routeWasCalled)
        XCTAssertEqual(.reminders, router.lastView)
    }
}
