public class AddReminderPresenter {

    weak var router: Router?

    public init(router: Router) {
        self.router = router
    }

    public func cancel() {
        router?.route(to: .reminders)
    }
}
