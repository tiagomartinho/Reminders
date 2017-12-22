import RemindersCore

class ControllerFactory {

    private let repository = InMemoryRemindersRepository()

    func build(from route: Route,
               with router: Router) -> ViewController {
        switch route {
        case .addReminder:
            return AddReminderViewControllerFactory(router: router,
                                                    repository: repository).build()
        case .reminders:
            return RemindersViewControllerFactory(router: router,
                                                  repository: repository).build()
        }
    }
}
