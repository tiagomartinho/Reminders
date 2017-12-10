public class RemindersPresenter {

    weak var view: RemindersView?
    weak var router: Router?
    weak var repository: RemindersRepository?

    public init(view: RemindersView,
                router: Router,
                repository: RemindersRepository) {
        self.view = view
        self.router = router
        self.repository = repository
    }

    public func loadReminders() {
        repository?.load()
        view?.showNoReminders()
    }

    public func addNewReminder() {
        router?.route(to: .addReminder)
    }
}
