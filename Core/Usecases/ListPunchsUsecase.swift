import Foundation

class ListPunchsUsecase {
    private var gateway: PunchGateway
    private var presenter: ListPunchsPresenter

    init(gateway: PunchGateway, presenter: ListPunchsPresenter) {
        self.gateway = gateway
        self.presenter = presenter
    }

    func list() {
        let punchs = self.gateway.list()
        presenter.list(punchs)
    }
}
