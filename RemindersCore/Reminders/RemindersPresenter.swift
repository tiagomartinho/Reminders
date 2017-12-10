public class RemindersPresenter {

    weak var view: RemindersView?
    let router: Router
    let repository: RemindersRepository

    public init(view: RemindersView,
                router: Router,
                repository: RemindersRepository) {
        self.view = view
        self.router = router
        self.repository = repository
    }

    public func loadReminders() {
        let reminders = repository.load()
        if reminders.isEmpty {
            view?.showNoReminders()
        } else {
            view?.showReminders(reminders: reminders)
        }
    }

    public func addNewReminder() {
        router.route(to: .addReminder)
    }
}
