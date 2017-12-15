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

    func route(to route: Route) {
        switch route {
        case .addReminder:
            let controllerToPresent = controllerFactory.build(from: route, factory: AddReminderViewControllerFactory(router: self, repository: InMemoryRemindersRepository()))
            controller?.present(controllerToPresent)
            controller = controllerToPresent
        case .reminders:
            if window?.rootView != nil {
                controller?.dismiss()
            } else {
                window?.rootView = controllerFactory.build(from: route, factory: RemindersViewControllerFactory(router: self, repository: InMemoryRemindersRepository()))
            }
            controller = window?.rootView
        }
    }
}
