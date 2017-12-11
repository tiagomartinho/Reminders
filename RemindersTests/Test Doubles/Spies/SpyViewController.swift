import UIKit

class SpyViewController: UIViewController {

    private(set) var dismissed = false
    private(set) var presenting = false

    override func present(_ viewControllerToPresent: UIViewController,
                          animated flag: Bool, completion: (() -> Void)? = nil) {
        presenting = true
        super.present(viewControllerToPresent, animated: flag, completion: completion)
    }

    override func dismiss(animated _: Bool, completion _: (() -> Void)? = nil) {
        dismissed = true
    }
}
