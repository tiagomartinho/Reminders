public class InMemoryRemindersRepository: RemindersRepository {

    public init() {
    }
    
    public func save(_ reminder: Reminder) {
    }

    public func load() -> [Reminder] {
        return []
    }
}
