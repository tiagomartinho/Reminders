public class AddReminderPresenter {

    let router: Router
    let repository: RemindersRepository

    public init(router: Router, repository: RemindersRepository) {
        self.router = router
        self.repository = repository
    }

    public func cancel() {
        router.route(to: .reminders)
    }

    public func save(_ reminder: Reminder) {
        repository.save(reminder)
        router.route(to: .reminders)
    }
}
