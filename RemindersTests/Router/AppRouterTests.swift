@testable import Reminders
import XCTest

class AppRouterTests: XCTestCase {
    func testAppRouter() {
        let window = UIWindow()
        window.makeKeyAndVisible()

        let addReminderController = SpyViewController()
        let reminderController = SpyViewController()
        let mockControllerFactory = MockControllerFactory(addReminderController: addReminderController,
                                                          reminderController: reminderController)

        let appRouter = AppRouter(window: window, controllerFactory: mockControllerFactory)
        appRouter.route(to: .reminders)

        XCTAssertNotNil(window.rootViewController)
        XCTAssertEqual(window.rootViewController!, reminderController)

        appRouter.route(to: .addReminder)

        XCTAssertNotNil(window.rootViewController?.presentedViewController)
        XCTAssertTrue(reminderController.presenting)
        XCTAssertEqual(window.rootViewController!.presentedViewController!, addReminderController)

        appRouter.route(to: .reminders)

        XCTAssertTrue(addReminderController.dismissed)
        XCTAssertNotNil(window.rootViewController)
        XCTAssertEqual(window.rootViewController!, reminderController)
    }
}
