import XCTest

@testable import MarcoPontoCore
@testable import MarcoPonto

class PunchGatewayCoreDataTests: XCTestCase {
    var gateway: PunchGatewayCoreData!

    override func setUp() {
        gateway = PunchGatewayCoreDataFactory.make()
    }

    func testShouldCreatePunch() {
        let punch = PunchStruct(id: nil, type: PunchType.Input, moment: NSDate())

        let createdPunch = gateway.create(punch)

        XCTAssertNotNil(createdPunch.id)
    }

    func testShouldUpdatePunch() {
        let punch = PunchStruct(id: nil, type: PunchType.Input, moment: NSDate())
        var createdPunch = gateway.create(punch)
        createdPunch.type = .Output

        let updatedPunch = gateway.update(createdPunch)

        XCTAssertEqual(PunchType.Output, updatedPunch.type)
        XCTAssertEqual(createdPunch.id, updatedPunch.id)
    }

    func testShouldListPunchs() {
        let punch = PunchStruct(id: nil, type: PunchType.Input, moment: NSDate())
        gateway.create(punch)

        let punchs = gateway.list()

        XCTAssertTrue(punchs.count > 0)
    }

    func testShouldListPunchsByInputTypeAndDate() {
        let firstDate = NSDate(fromDate: NSDate(), year: 1970, month: 1)
        let moment = NSDate(fromDate: NSDate(), year: 1970, month: 2)
        let lastDate = NSDate(fromDate: NSDate(), year: 1970, month: 3)
        let punch = PunchStruct(id: nil, type: PunchType.Input, moment: moment)
        gateway.create(punch)

        let inputPunchs = gateway.list(
            PunchType.Input, dateRange: (firstDate: firstDate, lastDate: lastDate))

        XCTAssertTrue(inputPunchs.count > 0)
    }
}
