import Foundation

public class ListPunchsUsecase {
    private var gateway: PunchGateway
    private var presenter: ListPunchsPresenter

    public init(gateway: PunchGateway, presenter: ListPunchsPresenter) {
        self.gateway = gateway
        self.presenter = presenter
    }

    public func list() {
        let punchs = self.gateway.list()
        presenter.list(punchs)
    }
}
