@testable import Reminders
import XCTest

class AppRouterTests: XCTestCase {
    func testAppRouter() {
        let fakeWindow = UIWindow()
        fakeWindow.makeKeyAndVisible()

        let addReminderController = SpyViewController()
        let reminderController = SpyViewController()
        let mockControllerFactory = MockControllerFactory(addReminderController: addReminderController,
                                                          reminderController: reminderController)

        let appRouter = AppRouter(window: fakeWindow, controllerFactory: mockControllerFactory)
        appRouter.route(to: .reminders)

        XCTAssertNotNil(fakeWindow.rootViewController)
        XCTAssertEqual(fakeWindow.rootViewController!, reminderController)

        appRouter.route(to: .addReminder)

        XCTAssertNotNil(fakeWindow.rootViewController?.presentedViewController)
        XCTAssertTrue(reminderController.presenting)
        XCTAssertEqual(fakeWindow.rootViewController!.presentedViewController!, addReminderController)

        appRouter.route(to: .reminders)

        XCTAssertTrue(addReminderController.dismissed)
        XCTAssertNotNil(fakeWindow.rootViewController)
        XCTAssertEqual(fakeWindow.rootViewController!, reminderController)
    }
}
