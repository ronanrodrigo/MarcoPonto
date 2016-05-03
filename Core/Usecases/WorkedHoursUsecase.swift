import Foundation
import SwiftDate

class WorkedHoursUsecase {
    private var gateway: PunchGateway
    private var dateRangeGateway: DateRangeGateway
    private var presenter: WorkedHoursPresenter

    init(gateway: PunchGateway, dateRangeGateway: DateRangeGateway, presenter: WorkedHoursPresenter) {
        self.gateway = gateway
        self.dateRangeGateway = dateRangeGateway
        self.presenter = presenter
    }

    func total() {
        let pastWeek = dateRangeGateway.pastWeek()
        let pastWeekWorkHours = calculateHours(
            between: pastWeek.firstDate,
            and: pastWeek.lastDate,
            type: .PastWeek)
        var workHours: [WorkHour] = [pastWeekWorkHours]

        let currentWeek = dateRangeGateway.currentWeek()
        let currentWeekWorkHours = calculateHours(
            between: currentWeek.firstDate,
            and: currentWeek.lastDate,
            type: .CurrentWeek)
        workHours.append(currentWeekWorkHours)

        let pastMonth = dateRangeGateway.pastMonth()
        let pastMonthWorkHours = calculateHours(
            between: pastMonth.firstDate,
            and: pastMonth.lastDate,
            type: .PastMonth)
        workHours.append(pastMonthWorkHours)

        let currentMonth = dateRangeGateway.currentMonth()
        let currentMonthWorkHours = calculateHours(
            between: currentMonth.firstDate,
            and: currentMonth.lastDate,
            type: .CurrentMonth)
        workHours.append(currentMonthWorkHours)

        let fromBeginning = dateRangeGateway.fromBeginning()
        let fromBeginningWorkHours = calculateHours(
            between: fromBeginning.firstDate,
            and: fromBeginning.lastDate,
            type: .All)
        workHours.append(fromBeginningWorkHours)

        presenter.showTotal(workHours)
    }

    private func calculateHours(between firstDate: NSDate, and lastDate: NSDate, type: WorkHourType) -> WorkHourStruct {
        let inputPunchs = gateway.list(by: .Input, between: firstDate, and: lastDate)
        let outputPunchs = gateway.list(by: .Output, between: firstDate, and: lastDate)
        let total = TotalWorkedHoursEntity(inputPunchs: inputPunchs, outputPunchs: outputPunchs).calculate()
        let mandatoryHours = 0.0
        let balance = BalanceWorkedHoursEntity(totalHours: total, mandatoryHours: mandatoryHours).calculate()

        return WorkHourStruct(type: type, total: total, balance: balance)
    }
}
