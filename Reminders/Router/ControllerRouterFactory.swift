import RemindersCore

class ControllerRouterFactory {

    private var controller: ViewController?
    private let window: Window

    init(controller: ViewController?,
         window: Window) {
        self.controller = controller
        self.window = window
    }

    func build(from route: Route) -> ViewControllerRouter {
        switch route {
        case .addReminder:
            return AddReminderRouter(controller: controller)
        case .reminders:
            return RemindersRouter(controller: controller, window: window)
        }
    }
}
