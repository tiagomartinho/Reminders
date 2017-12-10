@testable import RemindersCore

class SpyRemindersView: RemindersView {

    var showNoRemindersWasCalled = false
    var showAddReminderWasCalled = false
    
    func showNoReminders() {
        showNoRemindersWasCalled = true
    }

    func showAddReminder() {
        showAddReminderWasCalled = true
    }
}
