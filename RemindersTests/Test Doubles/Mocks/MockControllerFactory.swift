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

    override func build(from view: View, factory: UIViewControllerFactory) -> ViewController {
        switch view {
        case .addReminder:
            return addReminderController
        case .reminders:
            return reminderController
        }
    }
}
