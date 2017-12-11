import RemindersCore

class AppRouter: Router {

    private var controller: ViewController?
    private var window: Window?
    private let controllerFactory: ControllerFactory

    init(window: Window,
         controllerFactory: ControllerFactory = ControllerFactory()) {
        self.window = window
        self.controllerFactory = controllerFactory
    }

    func route(to view: View) {
        switch view {
        case .addReminder:
            let controllerToPresent = controllerFactory.build(from: view, router: self)
            controller?.present(controllerToPresent)
            controller = controllerToPresent
        case .reminders:
            if window?.rootView != nil {
                controller?.dismiss()
            } else {
                window?.rootView = controllerFactory.build(from: view, router: self)
            }
            controller = window?.rootView
        }
    }
}
