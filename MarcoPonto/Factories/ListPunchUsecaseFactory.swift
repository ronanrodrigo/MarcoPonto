import Foundation
import MarcoPontoCore

class ListPunchsUsecaseFactory {
    static func make(presenter presenter: ListPunchsPresenter) -> ListPunchsUsecase {
        return ListPunchsUsecase(gateway: PunchGatewayCoreDataFactory.make(), presenter: presenter)
    }
}
