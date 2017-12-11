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

class SpyViewController: UIViewController {
    private(set) var dismissed = false
    private(set) var presenting = false

    override func present(_ viewControllerToPresent: UIViewController,
                          animated flag: Bool, completion: (() -> Void)? = nil) {
        presenting = true
        super.present(viewControllerToPresent, animated: flag, completion: completion)
    }

    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        dismissed = true
    }
}
