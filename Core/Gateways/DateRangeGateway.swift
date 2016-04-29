import Foundation
import SwiftDate

protocol DateRangeGateway {
    func pastWeek() -> (firstDate: NSDate, lastDate: NSDate)
    func currentWeek() -> (firstDate: NSDate, lastDate: NSDate)
    func pastMonth() -> (firstDate: NSDate, lastDate: NSDate)
    func currentMonth() -> (firstDate: NSDate, lastDate: NSDate)
    func fromBeginning() -> (firstDate: NSDate, lastDate: NSDate)
}

class DateRangeGatewayDates: DateRangeGateway {
    var today: NSDate

    init() {
        today = NSDate(refDate: NSDate(), hour: 0, minute: 0, second: 0)
    }

    func pastWeek() -> (firstDate:NSDate, lastDate:NSDate) {
        let firstDate = (today-1.weeks).startOf(NSCalendarUnit.WeekOfYear)
        let lastDate = (today-1.weeks).endOf(NSCalendarUnit.WeekOfYear)
        return (firstDate: firstDate, lastDate: lastDate)
    }

    func currentWeek() -> (firstDate:NSDate, lastDate:NSDate) {
        let firstDate = today.startOf(NSCalendarUnit.WeekOfYear)
        let lastDate = today.endOf(NSCalendarUnit.WeekOfYear)
        return (firstDate: firstDate, lastDate: lastDate)
    }

    func pastMonth() -> (firstDate:NSDate, lastDate:NSDate) {
        let firstDate = (today-1.months).startOf(NSCalendarUnit.Month)
        let lastDate = (today-1.months).endOf(NSCalendarUnit.Month)
        return (firstDate: firstDate, lastDate: lastDate)
    }

    func currentMonth() -> (firstDate:NSDate, lastDate:NSDate) {
        let firstDate = today.startOf(NSCalendarUnit.Month)
        let lastDate = today.endOf(NSCalendarUnit.Month)
        return (firstDate: firstDate, lastDate: lastDate)
    }

    func fromBeginning() -> (firstDate:NSDate, lastDate:NSDate) {
        let firstDate = today.startOf(NSCalendarUnit.Era)
        let lastDate = today+1.days
        return (firstDate: firstDate, lastDate: lastDate)
    }

}