import RemindersCore
import UIKit

class AppRouter: Router {

    private var controller: UIViewController?
    private var window: UIWindow?

    init(window: UIWindow) {
        self.window = window
    }

    func route(to view: View) {
        switch view {
        case .addReminder:
            let controllerToPresent = ControllerFactory.build(from: view, router: self)
            controller?.present(controllerToPresent,
                                animated: true, completion: nil)
            controller = controllerToPresent
        case .reminders:
            if let _ = window?.rootViewController {
                controller?.dismiss(animated: true, completion: nil)
            } else {
                window?.rootViewController = ControllerFactory.build(from: view, router: self)
            }
            controller = window?.rootViewController
        }
    }
}
