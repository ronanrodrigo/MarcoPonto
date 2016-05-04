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

        gateway.create(punch)
        let createdPunch = gateway.list().last

        XCTAssertNotNil(createdPunch?.id)
        XCTAssertEqual(punch.type, createdPunch?.type)
        XCTAssertEqual(punch.moment.hour, createdPunch?.moment.hour)
        XCTAssertEqual(punch.moment.minute, createdPunch?.moment.minute)
    }

}
