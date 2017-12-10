public class InMemoryRemindersRepository: RemindersRepository {

    static var reminders = [Reminder]()

    public init() {
    }

    public func save(_ reminder: Reminder) {
        InMemoryRemindersRepository.reminders.append(reminder)
    }

    public func load() -> [Reminder] {
        return InMemoryRemindersRepository.reminders
    }
}
