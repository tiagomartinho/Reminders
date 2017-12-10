import RemindersCore

class InMemoryRemindersRepository: RemindersRepository {

    static var reminders = [Reminder]()

    func save(_ reminder: Reminder) {
        InMemoryRemindersRepository.reminders.append(reminder)
    }

    func load() -> [Reminder] {
        return InMemoryRemindersRepository.reminders
    }
}
