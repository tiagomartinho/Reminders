@testable import Reminders
import XCTest

class AppRouterTests: XCTestCase {

    var window: UIWindow!
    var reminderController: SpyViewController!
    var addReminderController: SpyViewController!
    var appRouter: AppRouter!

    override func setUp() {
        super.setUp()
        window = UIWindow()
        window.makeKeyAndVisible()
        addReminderController = SpyViewController()
        reminderController = SpyViewController()
        let controllerFactory = MockControllerFactory(addReminderController: addReminderController,
                                                      reminderController: reminderController)
        appRouter = AppRouter(window: window,
                              controllerFactory: controllerFactory)
    }

    func testInitialRoutingSetRootView() {
        appRouter.route(to: .reminders)

        XCTAssertNotNil(window.rootViewController)
        XCTAssertEqual(window.rootViewController!, reminderController)
    }

    func testAppRouter() {
        appRouter.route(to: .reminders)
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
