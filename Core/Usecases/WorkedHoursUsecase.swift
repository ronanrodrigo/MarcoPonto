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
        let pastWeekTotalHours = calculateHours(
            between: pastWeek.firstDate,
            and: pastWeek.lastDate)
        let pastWeekWorkWorkHours = WorkHourStruct(
            type: .PastWeek,
            total: pastWeekTotalHours)
        presenter.showTotal(pastWeekWorkWorkHours)

        let currentWeek = dateRangeGateway.currentWeek()
        let currentWeekTotalHours = calculateHours(
            between: currentWeek.firstDate,
            and: currentWeek.lastDate)
        let currentWeekWorkHours = WorkHourStruct(
            type: .CurrentWeek,
            total: currentWeekTotalHours)
        presenter.showTotal(currentWeekWorkHours)

        let pastMonth = dateRangeGateway.pastMonth()
        let pastMonthTotalHours = calculateHours(
            between: pastMonth.firstDate,
            and: pastMonth.lastDate)
        let pastMonthWorkHours = WorkHourStruct(
            type: .PastMonth,
            total: pastMonthTotalHours)
        presenter.showTotal(pastMonthWorkHours)

        let currentMonth = dateRangeGateway.currentMonth()
        let currentMonthTotalHours = calculateHours(
            between: currentMonth.firstDate,
            and: currentMonth.lastDate)
        let currentMonthWorkHours = WorkHourStruct(
            type: .CurrentMonth,
            total: currentMonthTotalHours)
        presenter.showTotal(currentMonthWorkHours)

        let fromBeginning = dateRangeGateway.fromBeginning()
        let fromBeginningTotalHours = calculateHours(
            between: fromBeginning.firstDate,
            and: fromBeginning.lastDate)
        let fromBeginningWorkHours = WorkHourStruct(
            type: .All,
            total: fromBeginningTotalHours)
        presenter.showTotal(fromBeginningWorkHours)
    }

    private func calculateHours(between firstDate: NSDate, and lastDate: NSDate) -> NSTimeInterval {
        let inputPunchs = gateway.list(by: .Input, between: firstDate, and: lastDate)
        let outputPunchs = gateway.list(by: .Output, between: firstDate, and: lastDate)
        let totalInterval = CalculateWorkedHoursEntity(
            inputPunchs: inputPunchs,
            outputPunchs: outputPunchs).calculate()
        return totalInterval
    }
}
