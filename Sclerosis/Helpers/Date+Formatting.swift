import Foundation

extension Date {
    /// Returns a localized, full-style date string (no time), respecting the user's current settings.
    var fullDayString: String {
        return Date.fullDayFormatter.string(from: self)
    }

    // MARK: - Private
    private static let fullDayFormatter: DateFormatter = {
        let fmt = DateFormatter()
        fmt.locale = .autoupdatingCurrent
        fmt.calendar = .autoupdatingCurrent
        fmt.dateStyle = .full
        fmt.timeStyle = .none
        return fmt
    }()
}
