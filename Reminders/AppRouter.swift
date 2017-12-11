import RemindersCore
import UIKit

class AppRouter: Router {
    private var controller: UIViewController?
    private var window: UIWindow?
    private let controllerFactory: ControllerFactory

    init(window: UIWindow,
         controllerFactory: ControllerFactory = ControllerFactory()) {
        self.window = window
        self.controllerFactory = controllerFactory
    }

    func route(to view: View) {
        switch view {
        case .addReminder:
            let controllerToPresent = controllerFactory.build(from: view, router: self)
            controller?.present(controllerToPresent,
                                animated: true, completion: nil)
            controller = controllerToPresent
        case .reminders:
            if window?.rootViewController != nil {
                controller?.dismiss(animated: true, completion: nil)
            } else {
                window?.rootViewController = controllerFactory.build(from: view, router: self)
            }
            controller = window?.rootViewController
        }
    }
}
