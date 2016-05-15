import XCTest

class ListPunchsUsecaseTests: XCTestCase {
    var gateway: PunchGatewaySpy!
    var presenter: ListPunchsPresenterSpy!
    var usecase: ListPunchsUsecase!

    override func setUp() {
        gateway = PunchGatewaySpy()
        presenter = ListPunchsPresenterSpy()
        usecase = ListPunchsUsecase(gateway: gateway, presenter: presenter)
    }

    func testShouldListPunchs() {
        self.usecase.list(NSDate())

        XCTAssertTrue(self.gateway.listByDay)
        XCTAssertTrue(self.presenter.listSpied)
    }
}
