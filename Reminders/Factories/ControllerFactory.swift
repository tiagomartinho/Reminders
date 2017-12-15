import RemindersCore
import UIKit

class ControllerFactory {
    func build(from route: Route, factory: UIViewControllerFactory) -> ViewController {
        return factory.build()
    }
}
