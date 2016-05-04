import Foundation

class SavePunchPresenterSpy: SavePunchPresenter {
    var didSavePunchSpied = false

    func didSavePunch() {
        didSavePunchSpied = true
    }
}
