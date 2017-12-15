import RemindersCore
import UIKit

class ControllerFactory {
    func build(from view: View, factory: UIViewControllerFactory) -> ViewController {
        return factory.build()
    }
}
