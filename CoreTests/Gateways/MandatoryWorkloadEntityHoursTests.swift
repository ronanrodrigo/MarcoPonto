import Foundation
import SwiftDate
import XCTest

class MandatoryWorkloadEntityHoursTests: XCTestCase {
    var entity: MandatoryWorkloadEntity!
    var now: NSDate!
    var beginningDate: NSDate!

    override func setUp() {
        now = NSDate(year: 2016, month: 6, day: 1, hour: 0, minute: 0)
        beginningDate = NSDate(year: now.year, month: now.month-1, day: 1)
        let referenceDate = NSDate(year: 2016, month: 6, day: 1)
        entity = MandatoryWorkloadEntity(referenceDate: referenceDate, beginningDate: beginningDate, now: now)
    }

    func testShouldReturnTotalHoursInAnWeekWhenIsCurrentWeekWorkHourType() {
        let weekWorkDays = 5.0
        let workHoursInAnWeek = weekWorkDays * entity.dailyHours

        let weekHours = entity.mandatoryHours(WorkHourType.CurrentWeek)

        XCTAssertEqual(workHoursInAnWeek, weekHours)
    }

    func testShouldReturnTotalHoursInAnWeekWhenIsPastWeekWorkHourType() {
        let weekWorkDays = 5.0
        let workHoursInAnWeek = weekWorkDays * entity.dailyHours

        let weekHours = entity.mandatoryHours(WorkHourType.PastWeek)

        XCTAssertEqual(workHoursInAnWeek, weekHours)
    }

    func testShouldReturnTotalHoursInReferenceDateWhenIsCurrentMonthWorkHourType() {
        let juneWorkDays = 22.0
        let workHoursInJune = juneWorkDays * entity.dailyHours

        let monthHours = entity.mandatoryHours(WorkHourType.CurrentMonth)

        XCTAssertEqual(workHoursInJune, monthHours)
    }

    func testShouldReturnTotalHoursInReferenceDateWhenIsPastMonthWorkHourType() {
        let juneWorkDays = 22.0
        let workHoursInJune = juneWorkDays * entity.dailyHours

        let monthHours = entity.mandatoryHours(WorkHourType.PastMonth)

        XCTAssertEqual(workHoursInJune, monthHours)
    }

    func testSouldReturnTotalHoursSinceReferenceDateUntilNowWhenIstAllWorkHourType() {
        let mayWorkDays = 22.0
        let workHoursInMay = mayWorkDays * entity.dailyHours

        let monthHours = entity.mandatoryHours(WorkHourType.All)

        XCTAssertEqual(workHoursInMay, monthHours)
    }
}
