@testable import RemindersCore

class SpyRemindersRepository: RemindersRepository {

    var saveWasCalled = false
    var lastReminder: Reminder?
    var loadWasCalled = false

    func save(_ reminder: Reminder) {
        saveWasCalled = true
        lastReminder = reminder
    }

    func load() -> [Reminder] {
        loadWasCalled = true
        return []
    }
}

