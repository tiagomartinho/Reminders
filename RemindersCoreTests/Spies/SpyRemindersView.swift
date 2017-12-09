@testable import RemindersCore

class SpyRemindersView: RemindersView {

    var showNoRemindersWasCalled = false

    func showNoReminders() {
        showNoRemindersWasCalled = true
    }
}
