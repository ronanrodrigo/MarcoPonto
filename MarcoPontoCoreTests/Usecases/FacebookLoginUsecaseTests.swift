import XCTest

class FacebookLoginUsecaseTests: XCTestCase {
    var usecase: FacebookLoginUsecase!
    var gateway: FacebookGatewaySpy!
    var presenter: FacebookLoginPresenterSpy!

    override func setUp() {
        gateway = FacebookGatewaySpy()
        presenter = FacebookLoginPresenterSpy()
        usecase = FacebookLoginUsecase(facebookGateway: gateway, facebookLoginPresenter: presenter)
    }

    func testShouldLoginWithFacebook() {
        usecase.login()

        XCTAssertTrue(gateway.loginSpied)
        XCTAssertTrue(presenter.succesSpied)
    }

    func testShouldNotLoginWithFacebookWhenRaisedExeption() {
        usecase.login()
        gateway.raiseException = true

        XCTAssertTrue(gateway.loginSpied)
        XCTAssertTrue(presenter.errorSpied)
    }
}
