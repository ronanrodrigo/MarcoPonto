import Foundation
import MarcoPontoCore

class CurrentWeekHoursUsecaseFactory {
    static func make(presenter: WorkedHoursPresenter) -> WorkedHoursUsecase {
        let gateway = PunchGatewayCoreDataFactory.make()
        return WorkedHoursUsecase(
            gateway: gateway, presenter: presenter)
    }
}
