import Foundation

public class SavePunchUsecase {
    private var gateway: PunchGateway
    private var presenter: SavePunchPresenter

    public init(gateway: PunchGateway, presenter: SavePunchPresenter) {
        self.gateway = gateway
        self.presenter = presenter
    }

    public func save(punch: Punch) {
        if punch.isNewPunch() {
            gateway.create(punch)
        } else {
            gateway.update(punch)
        }

        self.presenter.didSavePunch()
    }
}
