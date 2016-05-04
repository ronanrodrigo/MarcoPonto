import Foundation
import SwiftDate

public extension NSDate {
    static var today: NSDate {
        return NSDate(refDate: NSDate(), hour: 0, minute: 0, second: 0)
    }

    public static var pastWeek: (firstDate: NSDate, lastDate: NSDate) {
        let firstDate = (today-1.weeks).startOf(NSCalendarUnit.WeekOfYear)
        let lastDate = (today-1.weeks).endOf(NSCalendarUnit.WeekOfYear)
        return (firstDate: firstDate, lastDate: lastDate)
    }

    public static var currentWeek: (firstDate: NSDate, lastDate: NSDate) {
        let firstDate = today.startOf(NSCalendarUnit.WeekOfYear)
        let lastDate = today.endOf(NSCalendarUnit.WeekOfYear)
        return (firstDate: firstDate, lastDate: lastDate)
    }

    public static var pastMonth: (firstDate: NSDate, lastDate: NSDate) {
        let firstDate = (today-1.months).startOf(NSCalendarUnit.Month)
        let lastDate = (today-1.months).endOf(NSCalendarUnit.Month)
        return (firstDate: firstDate, lastDate: lastDate)
    }

    public static var currentMonth: (firstDate: NSDate, lastDate: NSDate) {
        let firstDate = today.startOf(NSCalendarUnit.Month)
        let lastDate = today.endOf(NSCalendarUnit.Month)
        return (firstDate: firstDate, lastDate: lastDate)
    }

    public static var fromBeginning: (firstDate: NSDate, lastDate: NSDate) {
        let firstDate = today.startOf(NSCalendarUnit.Era)
        let lastDate = today+1.days
        return (firstDate: firstDate, lastDate: lastDate)
    }
}
