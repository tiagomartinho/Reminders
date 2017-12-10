public class RemindersPresenter {

    weak var view: RemindersView?
    weak var router: Router?

    public init(view: RemindersView, router: Router) {
        self.view = view
        self.router = router
    }

    public func loadReminders() {
        view?.showNoReminders()
    }

    public func addNewReminder() {
        router?.route(to: .addReminder)
    }
}
