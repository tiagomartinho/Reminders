@testable import RemindersCore

class SpyRemindersRepository: RemindersRepository {

    var saveWasCalled = false
    var lastReminder: Reminder?

    func save(_ reminder: Reminder) {
        saveWasCalled = true
        lastReminder = reminder
    }
}

