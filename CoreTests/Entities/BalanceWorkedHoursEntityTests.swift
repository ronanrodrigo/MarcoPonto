import XCTest

class BalanceWorkedHoursEntityTests: XCTestCase {
    var balanceWorkedHoursEntity: BalanceWorkedHoursEntity!

    override func setUp() {
        let totalHours = NSTimeInterval(20)
        let mandatoryHours = NSTimeInterval(10)
        balanceWorkedHoursEntity = BalanceWorkedHoursEntity(totalHours: totalHours, mandatoryHours: mandatoryHours)
    }

    func testShouldCalculateDistanceBetweenHours() {
        let banaceHours = balanceWorkedHoursEntity.calculate()

        XCTAssertEqual(10, banaceHours)
    }

}
