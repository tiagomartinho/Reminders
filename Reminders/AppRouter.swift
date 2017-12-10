import RemindersCore
import UIKit

class AppRouter: Router {

    private var controller: UIViewController?
    private var window: UIWindow?

    init(controller: UIViewController) {
        self.controller = controller
    }

    init(window: UIWindow) {
        self.window = window
    }

    func route(to view: View) {
        if let controller = controller {
            controller.present(viewController(from: view),
                               animated: true, completion: nil)
        }
        if let window = window {
            window.rootViewController = viewController(from: view)
        }
    }

    private func viewController(from view: View) -> UIViewController {
        let rootViewController: UIViewController
        switch view {
        case .addReminder:
            rootViewController = AddReminderViewController()
        case .reminders:
            rootViewController = RemindersViewController()
        }
        return UINavigationController(rootViewController: rootViewController)
    }
}
