import Foundation
import SwiftDate

class MandatoryWorkloadEntity {
    let weekWorkDays = 5.0
    var now: NSDate
    var dailyHours: NSTimeInterval = 8.0.hoursToSeconds()

    init(now: NSDate = NSDate()) {
        self.now = now
    }

    func weeklyHours() -> NSTimeInterval {
        return weekWorkDays * dailyHours
    }

    func monthlyHours(referenceDate: NSDate) -> NSTimeInterval {
        let monthDays = referenceDate.monthDays
        var totalHours = 0.0
        for monthDay in 1...monthDays {
            let date = NSDate(refDate: referenceDate, day: monthDay)
            if isNotWeekend(date) {
                totalHours += dailyHours
            }
        }
        return totalHours
    }

    func fromBeginningHours(beginningDate: NSDate) -> NSTimeInterval {
        let timeInterval = now.timeIntervalSinceDate(beginningDate)
        let hoursInDay = 24.0, minutesInHour = 60.0, secondsInMinutes = 60.0
        let timeIntervalInDays = Int(timeInterval/hoursInDay/minutesInHour/secondsInMinutes)
        var totalHours = 0.0
        for day in 0...timeIntervalInDays {
            let date = NSDate(refDate: beginningDate, day: beginningDate.day + day)
            if isNotWeekend(date) {
                totalHours += dailyHours
            }
        }
        return totalHours
    }

    private func isNotWeekend(date: NSDate) -> Bool {
        if let isInWeekend = date.isInWeekend() where !isInWeekend {
            return true
        }
        return false
    }

}
