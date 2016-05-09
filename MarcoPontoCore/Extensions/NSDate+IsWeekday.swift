import Foundation

enum WeekDays: Int {
    case Sunday = 1, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday
}

extension NSDate {
    func isSunday() -> Bool {
        return self.weekday == WeekDays.Sunday.rawValue
    }
}
