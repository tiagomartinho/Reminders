import RemindersCore
import UIKit

class AppRouter: Router {

    private let controller: UIViewController

    init(controller: UIViewController) {
        self.controller = controller
    }

    func route(to view: View) {
        controller.present(viewControllerToPresent(view: view),
                           animated: true, completion: nil)
    }

    private func viewControllerToPresent(view: View) -> UIViewController {
        switch view {
        case .addReminder:
            return UINavigationController(rootViewController: AddReminderViewController())
        }
    }
}
