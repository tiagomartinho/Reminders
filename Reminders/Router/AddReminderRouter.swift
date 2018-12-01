import RemindersCore

class AddReminderRouter: ControllerRouter {
    private var controller: ViewController?
    private let window: Window

    init(controller: ViewController?,
         window: Window) {
        self.controller = controller
        self.window = window
    }

    func route(to controllerToPresent: ViewController) -> ViewController {
        let emptyWindow = (window.rootView == nil)
        if emptyWindow {
            window.rootView = controllerToPresent
        } else {
            controller?.present(controllerToPresent)
        }
        return controllerToPresent
    }
}
