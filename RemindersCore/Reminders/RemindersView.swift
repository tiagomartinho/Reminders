public protocol RemindersView: class {
    func showNoReminders()
    func showReminders(reminders: [Reminder])
}
