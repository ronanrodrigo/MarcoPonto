import Foundation
import MarcoPontoCore

class SavePunchUsecaseFactory {
    static func make(presenter presenter: SavePunchPresenter) -> SavePunchUsecase {
        return SavePunchUsecase(gateway: PunchGatewayCoreDataFactory.make(), presenter: presenter)
    }
}
