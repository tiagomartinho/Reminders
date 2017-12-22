import RemindersCore

class AddReminderRouter: ControllerRouter {

    private var controller: ViewController?

    init(controller: ViewController?) {
        self.controller = controller
    }

    func route(to controllerToPresent: ViewController) -> ViewController {
        controller?.present(controllerToPresent)
        return controllerToPresent
    }
}
