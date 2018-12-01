import RemindersCore
import UIKit

class AddReminderControllerFactory: ControllerFactory {
    let router: Router
    let repository: RemindersRepository

    init(router: Router, repository: RemindersRepository) {
        self.router = router
        self.repository = repository
    }

    func build() -> ViewController {
        let controller = AddReminderViewController()
        let presenter = AddReminderPresenter(view: controller,
                                             router: router,
                                             repository: repository)
        controller.presenter = presenter
        return UINavigationController(rootViewController: controller)
    }
}
