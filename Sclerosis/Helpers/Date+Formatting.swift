import Foundation

extension Date {
    /// Returns a localized, full-style date string (no time), respecting the user's current settings.
    var fullDayString: String {
        return Date.fullDayFormatter.string(from: self)
    }
}

// MARK: - Private
private extension Date {
    private static let fullDayFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = .autoupdatingCurrent
        formatter.calendar = .autoupdatingCurrent
        formatter.dateStyle = .full
        formatter.timeStyle = .none
        return formatter
    }()
}
