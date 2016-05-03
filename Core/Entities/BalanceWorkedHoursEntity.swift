import Foundation

class BalanceWorkedHoursEntity {
    var totalHours: NSTimeInterval
    var mandatoryHours: NSTimeInterval

    init (totalHours: NSTimeInterval, mandatoryHours: NSTimeInterval) {
        self.totalHours = totalHours
        self.mandatoryHours = mandatoryHours
    }

    func calculate() -> NSTimeInterval {
        return totalHours - mandatoryHours
    }
}
