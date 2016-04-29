import XCTest

class SavePunchUsecaseTests: XCTestCase {
    let now: NSDate = NSDate()
    var gateway: PunchGatewaySpy!
    var presenter: SavePunchPresenterSpy!
    var usecase: SavePunchUsecase!

    override func setUp() {
        gateway = PunchGatewaySpy()
        presenter = SavePunchPresenterSpy()
        usecase = SavePunchUsecase(gateway: gateway, presenter: presenter)
    }

    func testShoudCreatePunch() {
        let punch = PunchStruct(identifier: nil, type: .Input, moment: now)

        usecase.save(punch)

        XCTAssertTrue(gateway.createSpied)
        XCTAssertTrue(gateway.createSpied)
        XCTAssertTrue(presenter.didSavePunchSpied)
    }

    func testShoudUpdatePunch() {
        let punch = PunchStruct(identifier: 1, type: .Input, moment: now)

        usecase.save(punch)

        XCTAssertTrue(gateway.updateSpied)
        XCTAssertFalse(gateway.createSpied)
        XCTAssertTrue(presenter.didSavePunchSpied)
    }

}
