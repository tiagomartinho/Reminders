import RemindersCore
import UIKit

class ControllerFactory {
    func build(from view: View, factory: UIViewControllerFactory) -> ViewController {
        let rootViewController = factory.build()
        return UINavigationController(rootViewController: rootViewController)
    }
}

protocol UIViewControllerFactory {
    func build() -> UIViewController
}

class AddReminderViewControllerFactory: UIViewControllerFactory {

    let router: Router
    let repository: RemindersRepository

    init(router: Router, repository: RemindersRepository) {
        self.router = router
        self.repository = repository
    }

    func build() -> UIViewController {
        let controller = AddReminderViewController()
        let presenter = AddReminderPresenter(view: controller,
                                             router: router,
                                             repository: repository)
        controller.presenter = presenter
        return controller
    }
}

class RemindersViewControllerFactory: UIViewControllerFactory {

    let router: Router
    let repository: RemindersRepository

    init(router: Router, repository: RemindersRepository) {
        self.router = router
        self.repository = repository
    }

    func build() -> UIViewController {
        let controller = RemindersViewController()
        let presenter = RemindersPresenter(view: controller,
                                           router: router,
                                           repository: repository)
        controller.presenter = presenter
        return controller
    }
}
