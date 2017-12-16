@testable import Reminders
@testable import RemindersCore

class MockControllerFactory: ControllerFactory {

    private let addReminderController: ViewController
    private let reminderController: ViewController

    init(addReminderController: ViewController,
         reminderController: ViewController) {
        self.addReminderController = addReminderController
        self.reminderController = reminderController
    }

    override func build(from route: Route, factory: ViewControllerFactory) -> ViewController {
        switch route {
        case .addReminder:
            return addReminderController
        case .reminders:
            return reminderController
        }
    }
}
