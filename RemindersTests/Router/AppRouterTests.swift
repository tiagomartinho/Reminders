@testable import Reminders
import XCTest

class AppRouterTests: XCTestCase {
    var window: Window!
    var addReminderController: FakeViewController!
    var reminderController: FakeViewController!
    var appRouter: AppRouter!

    override func setUp() {
        super.setUp()
        window = FakeWindow()
        addReminderController = FakeViewController(identifier: "Add Reminder")
        reminderController = FakeViewController(identifier: "Reminders")
        let controllerFactory = MockControllerFactory(addReminderController: addReminderController,
                                                      reminderController: reminderController)
        appRouter = AppRouter(window: window,
                              controllerFactory: controllerFactory)
    }

    func testRouteToAddReminderFromPushNotification() {
        appRouter.route(to: .addReminder)

        let rootView = window.rootView as? FakeViewController
        XCTAssertEqual(rootView?.identifier, "Add Reminder")
    }

    func testInitialRoutingSetRootView() {
        appRouter.route(to: .reminders)

        let rootView = window.rootView as? FakeViewController
        XCTAssertEqual(rootView?.identifier, "Reminders")
    }

    func testRouteToAddReminderFromRemindersPresentView() {
        appRouter.route(to: .reminders)
        appRouter.route(to: .addReminder)

        XCTAssertTrue(reminderController.presented)
        let presentedView = window.rootView?.presentedView as? FakeViewController
        XCTAssertEqual(presentedView?.identifier, "Add Reminder")
    }

    func testRouteToRemindersFromAddDismissView() {
        appRouter.route(to: .reminders)
        appRouter.route(to: .addReminder)
        appRouter.route(to: .reminders)

        XCTAssertTrue(addReminderController.dismissed)
        let rootView = window.rootView as? FakeViewController
        XCTAssertEqual(rootView?.identifier, "Reminders")
    }
}
