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
    private var presenter: WorkedHoursPresenter
    
    init(gateway: PunchGateway, presenter: WorkedHoursPresenter) {
        self.gateway = gateway
        self.presenter = presenter
    }
    
    func total() {
        let today = NSDate(refDate: NSDate(), hour: 0, minute: 0, second: 0)

        let pastWeekFirstDate = (today-1.weeks).startOf(NSCalendarUnit.WeekOfYear)
        let pastWeekLastDate = (today-1.weeks).endOf(NSCalendarUnit.WeekOfYear)
        let pastWeekTotalHours = calculateHours(between: pastWeekFirstDate, and: pastWeekLastDate)
        let pastWeekWorkWorkHours = WorkHourStruct(title: "Semana passada", total: pastWeekTotalHours)
        presenter.showTotal(pastWeekWorkWorkHours)

        let currentWeekFirstDate = today.startOf(NSCalendarUnit.WeekOfYear)
        let currentWeekLastDate = today.endOf(NSCalendarUnit.WeekOfYear)
        let currentWeekTotalHours = calculateHours(between: currentWeekFirstDate, and: currentWeekLastDate)
        let currentWeekWorkHours = WorkHourStruct(title: "Semana atual", total: currentWeekTotalHours)
        presenter.showTotal(currentWeekWorkHours)

        let pasttMonthFirstDate = (today-1.months).startOf(NSCalendarUnit.Month)
        let pasttMonthLastDate = (today-1.months).endOf(NSCalendarUnit.Month)
        let pasttMonthTotalHours = calculateHours(between: pasttMonthFirstDate, and: pasttMonthLastDate)
        let pasttMonthWorkHours = WorkHourStruct(title: "Mês passado", total: pasttMonthTotalHours)
        presenter.showTotal(pasttMonthWorkHours)

        let currentMonthFirstDate = today.startOf(NSCalendarUnit.Month)
        let currentMonthLastDate = today.endOf(NSCalendarUnit.Month)
        let currentMonthTotalHours = calculateHours(between: currentMonthFirstDate, and: currentMonthLastDate)
        let currentMonthWorkHours = WorkHourStruct(title: "Mês atual", total: currentMonthTotalHours)
        presenter.showTotal(currentMonthWorkHours)

        let fromBeginningFirstDate = today.startOf(NSCalendarUnit.Era)
        let fromBeginningLastDate = today+1.days
        let fromBeginningTotalHours = calculateHours(between: fromBeginningFirstDate, and: fromBeginningLastDate)
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