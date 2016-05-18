import Foundation

class FacebookLoginPresenterSpy: FacebookLoginPresenter {
    var succesSpied = false
    var errorSpied = true

    func succes() {
        succesSpied = true
    }

    func error() {
        errorSpied = true
    }
}
