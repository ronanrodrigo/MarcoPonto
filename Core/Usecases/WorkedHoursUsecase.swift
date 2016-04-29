//
//  WorkedHoursUsecase.swift
//  MarcoPonto
//
//  Created by Ronan Rodrigo Nunes on 19/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

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
        let pastWeekTotalHours = calculateHours(between: pastWeek.firstDate, and: pastWeek.lastDate)
        let pastWeekWorkWorkHours = WorkHourStruct(title: "Semana passada", total: pastWeekTotalHours)
        presenter.showTotal(pastWeekWorkWorkHours)

        let currentWeek = dateRangeGateway.currentWeek()
        let currentWeekTotalHours = calculateHours(between: currentWeek.firstDate, and: currentWeek.lastDate)
        let currentWeekWorkHours = WorkHourStruct(title: "Semana atual", total: currentWeekTotalHours)
        presenter.showTotal(currentWeekWorkHours)

        let pasttMonth = dateRangeGateway.pastMonth()
        let pasttMonthTotalHours = calculateHours(between: pasttMonth.firstDate, and: pasttMonth.lastDate)
        let pasttMonthWorkHours = WorkHourStruct(title: "Mês passado", total: pasttMonthTotalHours)
        presenter.showTotal(pasttMonthWorkHours)

        let currentMonth = dateRangeGateway.currentMonth()
        let currentMonthTotalHours = calculateHours(between: currentMonth.firstDate, and: currentMonth.lastDate)
        let currentMonthWorkHours = WorkHourStruct(title: "Mês atual", total: currentMonthTotalHours)
        presenter.showTotal(currentMonthWorkHours)

        let fromBeginning = dateRangeGateway.fromBeginning()
        let fromBeginningTotalHours = calculateHours(between: fromBeginning.firstDate, and: fromBeginning.lastDate)
        let fromBeginningWorkHours = WorkHourStruct(title: "Total", total: fromBeginningTotalHours)
        presenter.showTotal(fromBeginningWorkHours)
    }
    
    private func calculateHours(between firstDate: NSDate, and lastDate: NSDate) -> NSTimeInterval {
        let inputPunchs = gateway.list(by: .Input, between: firstDate, and: lastDate)
        let outputPunchs = gateway.list(by: .Output, between: firstDate, and: lastDate)
        let totalInterval = WorkedHoursEntity(inputPunchs: inputPunchs, outputPunchs: outputPunchs).calculate()
        return totalInterval
    }
}