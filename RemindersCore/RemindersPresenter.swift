class RemindersPresenter {

    weak var view: RemindersView?

    init(view: RemindersView?) {
        self.view = view
    }

    func loadReminders() {
        view?.showNoReminders()
    }
}
