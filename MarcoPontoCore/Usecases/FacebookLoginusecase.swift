import Foundation

public struct FacebookLoginUsecase {
    let facebookGateway: FacebookGateway
    let facebookLoginPresenter: FacebookLoginPresenter

    func login() {
        do {
            try facebookGateway.login()
            facebookLoginPresenter.succes()
        } catch {
            facebookLoginPresenter.error()
        }
    }
}
