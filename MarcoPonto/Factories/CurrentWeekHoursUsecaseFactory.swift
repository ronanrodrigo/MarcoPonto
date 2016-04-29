import Foundation

class CurrentWeekHoursUsecaseFactory {
    static func make(presenter: WorkedHoursPresenter) -> WorkedHoursUsecase {
        let gateway = PunchGatewayCoreDataFactory.make()
        let dateRangeGateway = DateRangeGatewayDates()
        return WorkedHoursUsecase(gateway: gateway, dateRangeGateway: dateRangeGateway, presenter: presenter)
    }
}