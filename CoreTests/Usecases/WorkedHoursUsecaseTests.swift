import Foundation
import XCTest

class WorkedHoursUsecaseTests: XCTestCase {
    var usecase: WorkedHoursUsecase!
    var presenter: WorkedHoursPresenterFake!
    var gateway: PunchGatewaySpy!
    var dateRangeGateway: DateRangeGatewayFake!

    override func setUp() {
        gateway = PunchGatewaySpy()
        dateRangeGateway = DateRangeGatewayFake()
        presenter = WorkedHoursPresenterFake()
        usecase = WorkedHoursUsecase(
            gateway: gateway, dateRangeGateway: dateRangeGateway, presenter: presenter)
    }

    func testShouldHaveCompleteWokedHoursReport() {
        usecase.total()

        XCTAssertEqual(5, presenter.workHours.count)
        XCTAssertEqual(10, gateway.listSpieds.count)
    }

    func testShouldHaveGetAllDateRanges() {
        usecase.total()

        XCTAssertTrue(dateRangeGateway.pastWeekSpied)
        XCTAssertTrue(dateRangeGateway.currentWeekSpied)
        XCTAssertTrue(dateRangeGateway.pastMonthSpied)
        XCTAssertTrue(dateRangeGateway.currentMonthSpied)
        XCTAssertTrue(dateRangeGateway.fromBeginningSpied)
    }
}
