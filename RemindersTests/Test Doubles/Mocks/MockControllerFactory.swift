@testable import Reminders
import RemindersCore
import UIKit

class MockControllerFactory: ControllerFactory {
    private let addReminderController: UIViewController
    private let reminderController: UIViewController

    init(addReminderController: UIViewController,
         reminderController: UIViewController) {
        self.addReminderController = addReminderController
        self.reminderController = reminderController
        super.init(repository: InMemoryRemindersRepository())
    }

    override func build(from view: View, router: Router) -> UIViewController {
        switch view {
        case .addReminder:
            return addReminderController
        case .reminders:
            return reminderController
        }
    }
}
