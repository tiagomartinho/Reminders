public class RemindersPresenter {

    weak var view: RemindersView?

    public init(view: RemindersView?) {
        self.view = view
    }

    public func loadReminders() {
        view?.showNoReminders()
    }
}
