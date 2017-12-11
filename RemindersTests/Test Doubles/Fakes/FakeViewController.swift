@testable import Reminders

class FakeViewController: ViewController {

    private(set) var dismissed = false
    private(set) var presented = false

    var presentedView: ViewController?

    let id: String

    init(id: String) {
        self.id = id
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
