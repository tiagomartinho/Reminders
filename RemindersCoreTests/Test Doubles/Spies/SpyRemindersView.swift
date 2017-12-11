@testable import RemindersCore

class SpyRemindersView: RemindersView {

    var showNoRemindersWasCalled = false
    var showRemindersWasCalled = false
    var remindersShown: [Reminder]!

    func showNoReminders() {
        showNoRemindersWasCalled = true
    }

    func showReminders(reminders: [Reminder]) {
        showRemindersWasCalled = true
        remindersShown = reminders
    }
}
