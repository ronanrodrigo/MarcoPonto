import Foundation
import XCTest

class WorkedHoursUsecaseTests: XCTestCase {
    var usecase: WorkedHoursUsecase!
    var presenter: WorkedHoursPresenterFake!
    var gateway: PunchGatewaySpy!

    override func setUp() {
        gateway = PunchGatewaySpy()
        presenter = WorkedHoursPresenterFake()
        usecase = WorkedHoursUsecase(gateway: gateway, presenter: presenter)
    }

    func testShouldHaveCompleteWokedHoursReport() {
        usecase.workedHours()

        XCTAssertEqual(5, presenter.workHours.count)
    }

    func testShouldGetFirstPunchWhenIsForAllWorkHourType() {
        let punch = PunchStruct(id: nil, type: PunchType.Input, moment: NSDate())
        gateway.create(punch)

        usecase.workedHours()

        XCTAssertEqual(5, presenter.workHours.count)
        XCTAssertTrue(gateway.listSpied)
    }
}
