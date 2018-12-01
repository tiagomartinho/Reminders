@testable import Reminders

class FakeViewController: ViewController {
    private(set) var dismissed = false
    private(set) var presented = false

    var presentedView: ViewController?

    let identifier: String

    init(identifier: String) {
        self.identifier = identifier
    }

    func present(_ viewControllerToPresent: ViewController) {
        presented = true
        presentedView = viewControllerToPresent
    }

    func dismiss() {
        dismissed = true
        presentedView = nil
    }
}
