@testable import RemindersCore

class MockRemindersRepository: RemindersRepository {

    private(set) var saveWasCalled = false
    private(set) var lastReminder: Reminder?
    private(set) var loadWasCalled = false

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
