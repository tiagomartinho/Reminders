protocol ViewController: class {
    var presentedView: ViewController? { get }
    func present(_ viewControllerToPresent: ViewController)
    func dismiss()
}
