import RemindersCore

class AppRouter: Router {
    private var controller: ViewController?

    private let window: Window
    private let controllerFactory: ViewControllerFactory

    init(window: Window, controllerFactory: ViewControllerFactory) {
        self.window = window
        self.controllerFactory = controllerFactory
    }

    func route(to route: Route) {
        let controllerToPresent = controllerFactory.build(from: route,
                                                          with: self)
        let router = ControllerRouterFactory(controller: controller,
                                             window: window).build(from: route)
        controller = router.route(to: controllerToPresent)
    }
}
