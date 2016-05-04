import Foundation

struct WorkedHoursUsecase {
    var gateway: PunchGateway
    var presenter: WorkedHoursPresenter

    func workedHours() {
        let workHours = WorkHourType.types.map({ calculateHours($0) })
        presenter.showTotal(workHours)
    }

    private func calculateHours(type: WorkHourType) -> WorkHour {
        let inputPunchs = gateway.list(.Input, dateRange: type.dateRange)
        let outputPunchs = gateway.list(.Output, dateRange: type.dateRange)

        let total = TotalWorkedHoursEntity(
            inputPunchs: inputPunchs, outputPunchs: outputPunchs).calculate()

        let mandatoryHours = MandatoryWorkloadEntity(
            referenceDate: type.dateRange.firstDate,
            beginningDate: beginningDate()).mandatoryHours(type)

        let balance = BalanceWorkedHoursEntity(
            totalHours: total, mandatoryHours: mandatoryHours).calculate()

        return WorkHourStruct(type: type, total: total, balance: balance)
    }

    private func beginningDate() -> NSDate {
        if let punch = gateway.list().first {
            return punch.moment
        }
        return NSDate()
    }

}
