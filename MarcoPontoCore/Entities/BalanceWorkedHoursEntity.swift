import Foundation

public class BalanceWorkedHoursEntity {
    var totalHours: NSTimeInterval
    var mandatoryHours: NSTimeInterval

    public init (totalHours: NSTimeInterval, mandatoryHours: NSTimeInterval) {
        self.totalHours = totalHours
        self.mandatoryHours = mandatoryHours
    }

    public func calculate() -> NSTimeInterval {
        return totalHours - mandatoryHours
    }
}
