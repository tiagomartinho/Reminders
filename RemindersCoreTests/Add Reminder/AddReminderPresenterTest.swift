import XCTest
@testable import RemindersCore

class AddReminderPresenterTest: XCTestCase {

    func testSaveReminderToRepository() {
        let router = SpyRouter()
        let repository = SpyRemindersRepository()
        let presenter = AddReminderPresenter(router: router, repository: repository)
        let reminder = Reminder(title: "Read Clean Architecture")

        presenter.save(reminder)

        XCTAssert(repository.saveWasCalled)
        XCTAssertEqual(reminder, repository.lastReminder)
    }

    func testRouteToRemindersViewWithCancel() {
        let router = SpyRouter()
        let repository = SpyRemindersRepository()
        let presenter = AddReminderPresenter(router: router, repository: repository)

        presenter.cancel()

        XCTAssert(router.routeWasCalled)
        XCTAssertEqual(.reminders, router.lastView)
    }

    func testRouteToRemindersViewWithSave() {
        let router = SpyRouter()
        let repository = SpyRemindersRepository()
        let presenter = AddReminderPresenter(router: router, repository: repository)
        let reminder = Reminder(title: "Read Clean Architecture")

        presenter.save(reminder)

        XCTAssert(router.routeWasCalled)
        XCTAssertEqual(.reminders, router.lastView)
    }
}
