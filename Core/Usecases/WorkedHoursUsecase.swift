import Foundation
import SwiftDate

class WorkedHoursUsecase {
    private var gateway: PunchGateway
    private var presenter: WorkedHoursPresenter

    init(gateway: PunchGateway, presenter: WorkedHoursPresenter) {
        self.gateway = gateway
        self.presenter = presenter
    }

    func workedHours() {
        var workHours: [WorkHour] = []
        for type in WorkHourType.types {
            workHours.append(calculateHours(type))
        }
        presenter.showTotal(workHours)
    }

    private func calculateHours(type: WorkHourType) -> WorkHourStruct {
        let inputPunchs = gateway.list(by: .Input, between: type.dateRange.firstDate, and: type.dateRange.lastDate)
        let outputPunchs = gateway.list(by: .Output, between: type.dateRange.firstDate, and: type.dateRange.lastDate)
        let total = TotalWorkedHoursEntity(inputPunchs: inputPunchs, outputPunchs: outputPunchs).calculate()
        let mandatoryHours = 0.0
        let balance = BalanceWorkedHoursEntity(totalHours: total, mandatoryHours: mandatoryHours).calculate()

        return WorkHourStruct(type: type, total: total, balance: balance)
    }
}
