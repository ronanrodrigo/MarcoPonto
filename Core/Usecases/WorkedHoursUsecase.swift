import Foundation
import SwiftDate

class WorkedHoursUsecase {
    private var gateway: PunchGateway
    private var presenter: WorkedHoursPresenter

    init(gateway: PunchGateway, presenter: WorkedHoursPresenter) {
        self.gateway = gateway
        self.presenter = presenter
    }

    func total() {
        let pastWeekWorkHours = calculateHours(NSDate.pastWeek, type: .PastWeek)
        var workHours: [WorkHour] = [pastWeekWorkHours]

        let currentWeekWorkHours = calculateHours(NSDate.currentWeek, type: .CurrentWeek)
        workHours.append(currentWeekWorkHours)

        let pastMonthWorkHours = calculateHours(NSDate.pastMonth, type: .PastMonth)
        workHours.append(pastMonthWorkHours)

        let currentMonthWorkHours = calculateHours(NSDate.currentMonth, type: .CurrentMonth)
        workHours.append(currentMonthWorkHours)

        let fromBeginningWorkHours = calculateHours(NSDate.fromBeginning, type: .All)
        workHours.append(fromBeginningWorkHours)

        presenter.showTotal(workHours)
    }

    private func calculateHours(dates: (firstDate: NSDate, lastDate: NSDate), type: WorkHourType) -> WorkHourStruct {
        let inputPunchs = gateway.list(by: .Input, between: dates.firstDate, and: dates.lastDate)
        let outputPunchs = gateway.list(by: .Output, between: dates.firstDate, and: dates.lastDate)
        let total = TotalWorkedHoursEntity(inputPunchs: inputPunchs, outputPunchs: outputPunchs).calculate()
        let mandatoryHours = 0.0
        let balance = BalanceWorkedHoursEntity(totalHours: total, mandatoryHours: mandatoryHours).calculate()

        return WorkHourStruct(type: type, total: total, balance: balance)
    }
}
