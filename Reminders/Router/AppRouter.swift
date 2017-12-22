import RemindersCore

class AppRouter: Router {

    private var controller: ViewController?
    private var window: Window?
    private let controllerFactory: ControllerFactory

    init(window: Window, controllerFactory: ControllerFactory) {
        self.window = window
        self.controllerFactory = controllerFactory
    }

    func route(to route: Route) {
        let controllerToPresent = controllerFactory.build(from: route,
                                                          with: self)

        switch route {
        case .addReminder:
            controller?.present(controllerToPresent)
            controller = controllerToPresent
        case .reminders:
            if window?.rootView != nil {
                controller?.dismiss()
            } else {
                window?.rootView = controllerToPresent
            }
            controller = window?.rootView
        }
    }
}
