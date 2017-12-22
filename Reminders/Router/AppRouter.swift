import RemindersCore

class AppRouter: Router {

    private var controller: ViewController?

    private let window: Window
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
            controller = AddReminderRouter(controller: controller).route(to: controllerToPresent)
        case .reminders:
            controller = RemindersRouter(controller: controller, window: window).route(to: controllerToPresent)
        }
    }
}
