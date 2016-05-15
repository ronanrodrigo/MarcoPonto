import Foundation

public class ListPunchsUsecase {
    private var gateway: PunchGateway
    private var presenter: ListPunchsPresenter

    public init(gateway: PunchGateway, presenter: ListPunchsPresenter) {
        self.gateway = gateway
        self.presenter = presenter
    }

    public func list(day: NSDate) {
        let punchs = self.gateway.list(day)
        presenter.list(punchs)
    }
}
