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
        presenter.showTotal(pastWeekWorkHours)

        let currentWeek = dateRangeGateway.currentWeek()
        let currentWeekWorkHours = calculateHours(
            between: currentWeek.firstDate,
            and: currentWeek.lastDate,
            type: .CurrentWeek)
        presenter.showTotal(currentWeekWorkHours)

        let pastMonth = dateRangeGateway.pastMonth()
        let pastMonthWorkHours = calculateHours(
            between: pastMonth.firstDate,
            and: pastMonth.lastDate,
            type: .PastMonth)
        presenter.showTotal(pastMonthWorkHours)

        let currentMonth = dateRangeGateway.currentMonth()
        let currentMonthWorkHours = calculateHours(
            between: currentMonth.firstDate,
            and: currentMonth.lastDate,
            type: .CurrentMonth)
        presenter.showTotal(currentMonthWorkHours)

        let fromBeginning = dateRangeGateway.fromBeginning()
        let fromBeginningWorkHours = calculateHours(
            between: fromBeginning.firstDate,
            and: fromBeginning.lastDate,
            type: .All)
        presenter.showTotal(fromBeginningWorkHours)
    }

    private func calculateHours(between firstDate: NSDate, and lastDate: NSDate, type: WorkHourType) -> WorkHourStruct {
        let inputPunchs = gateway.list(by: .Input, between: firstDate, and: lastDate)
        let outputPunchs = gateway.list(by: .Output, between: firstDate, and: lastDate)
        let totalInterval = CalculateWorkedHoursEntity(
            inputPunchs: inputPunchs,
            outputPunchs: outputPunchs).calculate()

        return WorkHourStruct(type: type, total: totalInterval)
    }
}
