import XCTest

class WorkHourTypeTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    func testShouldBeAnPastWeekStringWhenWasPastWeekType() {
        XCTAssertEqual("Semana passada", WorkHourType.PastWeek.title)
    }

    func testShouldBeAnCurrentWeekStringWhenWasCurrentWeekType() {
        XCTAssertEqual("Semana atual", WorkHourType.CurrentWeek.title)
    }

    func testShouldBeAnPastMonthStringWhenWasPastMonthType() {
        XCTAssertEqual("Mês passado", WorkHourType.PastMonth.title)
    }

    func testShouldBeAnCurrentMonthStringWhenWasCurrentMonthType() {
        XCTAssertEqual("Mês atual", WorkHourType.CurrentMonth.title)
    }

    func testShouldBeAnAllStringWhenWasAllType() {
        XCTAssertEqual("Tudo", WorkHourType.All.title)
    }
}
