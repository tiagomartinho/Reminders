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
        switch view {
        case .addReminder:
            controller?.present(viewController(from: view), animated: true, completion: nil)
        case .reminders:
            if let _ = window?.rootViewController {
                controller?.dismiss(animated: true, completion: nil)
                controller = window?.rootViewController
            } else {
                window?.rootViewController = viewController(from: view)
            }
        }
    }

    private func viewController(from view: View) -> UIViewController {
        let rootViewController: UIViewController
        switch view {
        case .addReminder:
            rootViewController = buildAddReminderViewController()
        case .reminders:
            rootViewController = buildRemindersViewController()
        }
        controller = UINavigationController(rootViewController: rootViewController)
        return controller!
    }

    private func buildAddReminderViewController() -> AddReminderViewController {
        let controller = AddReminderViewController()
        let repository = InMemoryRemindersRepository()
        let presenter = AddReminderPresenter(router: self,
                                             repository: repository)
        controller.presenter = presenter
        return controller
    }

    private func buildRemindersViewController() -> RemindersViewController {
        let controller = RemindersViewController()
        let repository = InMemoryRemindersRepository()
        let presenter = RemindersPresenter(view: controller,
                                           router: self,
                                           repository: repository)
        controller.presenter = presenter
        return controller
    }
}
