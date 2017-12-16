import RemindersCore
import UIKit

class RemindersViewControllerFactory: ViewControllerFactory {

    let router: Router
    let repository: RemindersRepository

    init(router: Router, repository: RemindersRepository) {
        self.router = router
        self.repository = repository
    }

    func build() -> ViewController {
        let controller = RemindersViewController()
        let presenter = RemindersPresenter(view: controller,
                                           router: router,
                                           repository: repository)
        controller.presenter = presenter
        return UINavigationController(rootViewController: controller)
    }
}
