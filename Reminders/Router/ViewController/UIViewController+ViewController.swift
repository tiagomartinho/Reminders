import UIKit

extension UIViewController: ViewController {

    var presentedView: ViewController? {
        return presentedViewController
    }

    func dismiss() {
        dismiss(animated: true, completion: nil)
    }

    func present(_ viewControllerToPresent: ViewController) {
        if let viewControllerToPresent = viewControllerToPresent as? UIViewController {
            present(viewControllerToPresent, animated: true, completion: nil)
        }
    }
}
