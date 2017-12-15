import RemindersCore
import UIKit

class ControllerFactory {
    func build(from view: View, factory: UIViewControllerFactory) -> ViewController {
        let rootViewController = factory.build()
        return UINavigationController(rootViewController: rootViewController)
    }
}
