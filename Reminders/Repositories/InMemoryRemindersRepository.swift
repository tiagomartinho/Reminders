import RemindersCore

class InMemoryRemindersRepository: RemindersRepository {
    private var reminders = [Reminder]()

    func save(_ reminder: Reminder) {
        reminders.append(reminder)
    }

    func load() -> [Reminder] {
        return reminders
    }
}
