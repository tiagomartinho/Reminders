@testable import RemindersCore

class MockRemindersRepository: RemindersRepository {

    var saveWasCalled = false
    var lastReminder: Reminder?
    var loadWasCalled = false
    var reminders = [Reminder]()

    func save(_ reminder: Reminder) {
        saveWasCalled = true
        lastReminder = reminder
    }

    func load() -> [Reminder] {
        loadWasCalled = true
        return reminders
    }
}

