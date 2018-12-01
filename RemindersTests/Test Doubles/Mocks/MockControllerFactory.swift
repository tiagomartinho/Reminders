@testable import Reminders
@testable import RemindersCore

class MockControllerFactory: ViewControllerFactory {
    private let addReminderController: ViewController
    private let reminderController: ViewController

    init(addReminderController: ViewController,
         reminderController: ViewController) {
        self.addReminderController = addReminderController
        self.reminderController = reminderController
    }

    override func build(from route: Route,
                        with _: Router) -> ViewController {
        switch route {
        case .addReminder:
            return addReminderController
        case .reminders:
            return reminderController
        }
    }
}
