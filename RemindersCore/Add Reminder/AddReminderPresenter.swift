public class AddReminderPresenter {
    weak var view: AddReminderView?
    let router: Router
    let repository: RemindersRepository

    public init(view: AddReminderView, router: Router, repository: RemindersRepository) {
        self.view = view
        self.router = router
        self.repository = repository
    }

    public func cancel() {
        router.route(to: .reminders)
    }

    public func save() {
        guard let title = view?.reminderTitle else { return }
        let reminder = Reminder(title: title)
        repository.save(reminder)
        router.route(to: .reminders)
    }
}
