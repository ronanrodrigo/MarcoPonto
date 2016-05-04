import Foundation

class ListPunchsPresenterSpy: ListPunchsPresenter {
    var listSpied = false

    func list(punchs: [Punch]) {
        listSpied = true
    }
}
