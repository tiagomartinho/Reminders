public struct Reminder {
    public let title: String

    public init(title: String) {
        self.title = title
    }
}

extension Reminder: Equatable {
    public static func == (lhs: Reminder, rhs: Reminder) -> Bool {
        return lhs.title == rhs.title
    }
}
