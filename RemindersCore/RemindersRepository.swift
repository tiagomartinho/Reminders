public protocol RemindersRepository: class {
    func save(_ reminder: Reminder)
    func load() -> [Reminder]
}
