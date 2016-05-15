import XCTest

@testable import MarcoPontoCore
@testable import MarcoPonto
import SwiftDate

class PunchGatewayCoreDataTests: XCTestCase {
    var gateway: PunchGatewayCoreData!

    override func setUp() {
        gateway = PunchGatewayCoreDataFactory.make()
    }

    func testShouldCreatePunch() {
        let punch = PunchStruct(id: nil, type: .Input, moment: NSDate())

        let createdPunch = gateway.create(punch)

        XCTAssertNotNil(createdPunch.id)
    }

    func testShouldUpdatePunch() {
        let punch = PunchStruct(id: nil, type: .Input, moment: NSDate())
        var createdPunch = gateway.create(punch)
        createdPunch.type = .Output

        let updatedPunch = gateway.update(createdPunch)

        XCTAssertEqual(PunchType.Output, updatedPunch.type)
        XCTAssertEqual(createdPunch.id, updatedPunch.id)
    }

    func testShouldListPunchs() {
        let punch = PunchStruct(id: nil, type: .Input, moment: NSDate())
        gateway.create(punch)

        let punchs = gateway.list()

        XCTAssertTrue(punchs.count > 0)
    }

    func testShouldListPunchsByInputTypeAndDate() {
        let firstDate = NSDate(fromDate: NSDate(), year: 2016, month: 1)
        let moment = NSDate(fromDate: NSDate(), year: 2016, month: 2)
        let lastDate = NSDate(fromDate: NSDate(), year: 2016, month: 3)
        let punch = PunchStruct(id: nil, type: .Input, moment: moment)
        gateway.create(punch)

        let inputPunchs = gateway.list(
            PunchType.Input, dateRange: (firstDate: firstDate, lastDate: lastDate))

        XCTAssertTrue(inputPunchs.count > 0)
    }

    func testShouldDeltePunch() {
        let punch = PunchStruct(id: nil, type: .Input, moment: NSDate())
        let createdPunch = gateway.create(punch)

        gateway.delete(createdPunch)

        let punchs = gateway.list()
        XCTAssertEqual(0, punchs.filter({$0.id == createdPunch.id}).count)
    }

    func testShouldNotDeleteAnyPunchWhenIDWasNil() {
        let punch = PunchStruct(id: nil, type: .Input, moment: NSDate())
        let beforeDeleteQuantity = gateway.list().count

        gateway.delete(punch)

        let afterDelteQuantity = gateway.list().count
        XCTAssertEqual(beforeDeleteQuantity, afterDelteQuantity)
    }

    func testShouldListPunchsByDateRange() {
        let moment = NSDate(fromDate: NSDate(), year: 2016, month: 2)
        let punch = PunchStruct(id: nil, type: .Input, moment: moment)
        let createdPunch = gateway.create(punch)

        let inputPunchs = gateway.list(moment)

        XCTAssertTrue(inputPunchs.filter({$0.id == createdPunch.id}).count == 1)
    }
}
