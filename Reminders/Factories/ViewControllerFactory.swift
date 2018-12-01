import RemindersCore

class ViewControllerFactory {
    private let repository = InMemoryRemindersRepository()

    func build(from route: Route,
               with router: Router) -> ViewController {
        switch route {
        case .addReminder:
            return AddReminderControllerFactory(router: router,
                                                repository: repository).build()
        case .reminders:
            return RemindersControllerFactory(router: router,
                                              repository: repository).build()
        }
    }
}
