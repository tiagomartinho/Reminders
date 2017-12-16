import RemindersCore

class ControllerFactory {
    func build(from route: Route, factory: ViewControllerFactory) -> ViewController {
        return factory.build()
    }
}
