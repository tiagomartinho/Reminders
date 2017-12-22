import RemindersCore

class RemindersRouter: ControllerRouter {

    private var controller: ViewController?
    private let window: Window

    init(controller: ViewController?,
         window: Window) {
        self.controller = controller
        self.window = window
    }

    func route(to controllerToPresent: ViewController) -> ViewController {
        if window.rootView != nil {
            controller?.dismiss()
        } else {
            window.rootView = controllerToPresent
        }
        return window.rootView!
    }
}

