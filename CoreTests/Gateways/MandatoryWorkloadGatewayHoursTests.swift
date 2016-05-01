import Foundation
import SwiftDate
import XCTest

class MandatoryWorkloadGatewayHoursTests: XCTestCase {
    var gateway: MandatoryWorkloadGateway!
    var now: NSDate!

    override func setUp() {
        now = NSDate(year: 2016, month: 6, day: 1, hour: 0, minute: 0)
        gateway = MandatoryWorkloadGatewayHours(now: now)
    }

    func testShouldReturnTotalHoursInAnWeek() {
        let weekWorkDays = 5.0
        let workHoursInAnWeek = weekWorkDays * gateway.dailyHours

        let weekHours = gateway.weeklyHours()

        XCTAssertEqual(workHoursInAnWeek, weekHours)
    }

    func testShouldReturnTotalHoursInReferenceDate() {
        let referenceDate = NSDate(year: 2016, month: 6, day: 1)
        let juneWorkDays = 22.0
        let workHoursInJune = juneWorkDays * gateway.dailyHours

        let monthHours = gateway.monthlyHours(referenceDate)

        XCTAssertEqual(workHoursInJune, monthHours)
    }

    func testSouldReturnTotalHoursSinceReferenceDateUntilNow() {
        let startDate = NSDate(year: now.year, month: now.month-2, day: 1)
        let workHoursInApril = gateway.monthlyHours(startDate)
        let workHoursInMay = gateway.monthlyHours(startDate + 1.months)
        let workHoursInJune = gateway.dailyHours
        let workHoursTotal = workHoursInApril + workHoursInMay + workHoursInJune

        let monthHours = gateway.fromBeginningHours(startDate)

        XCTAssertEqual(workHoursTotal, monthHours)
    }
}
