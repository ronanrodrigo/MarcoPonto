//
//  WeekWorkedHoursUsecase.swift
//  MarcoPonto
//
//  Created by Ronan Rodrigo Nunes on 19/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import Foundation
import SwiftDate

class WeekWorkedHoursUsecase {
    private var gateway: PunchGateway
    private var presenter: WeekWorkedHoursPresenter
    
    init(gateway: PunchGateway, presenter: WeekWorkedHoursPresenter) {
        self.gateway = gateway
        self.presenter = presenter
    }
    
    func total() {
        presenter.showTotal(currentWeekHours())
        presenter.showTotal(pastWeekHours())
    }

    private func currentWeekHours() -> WorkHourGroupStruct {
        let currentWeekHours = weekHours()
        return WorkHourGroupStruct(title: "Semana atual", workHours: [currentWeekHours])
    }

    private func pastWeekHours() -> WorkHourGroupStruct {
        let pastWeek = NSDate() - 1.weeks
        let pastWeekHours = weekHours(pastWeek)
        return WorkHourGroupStruct(title: "Semana passada", workHours: [pastWeekHours])
    }

    private func weekHours(reference: NSDate = NSDate()) -> WorkHourStruct {
        let firstDate = reference.startOf(NSCalendarUnit.WeekOfYear)
        let lastDate = reference.endOf(NSCalendarUnit.WeekOfYear)
        let inputPunchs = gateway.list(by: .Input, between: firstDate, and: lastDate)
        let outputPunchs = gateway.list(by: .Output, between: firstDate, and: lastDate)
        let totalInterval = HoursWorkedEntity(inputPunchs: inputPunchs, outputPunchs: outputPunchs).calculate()
        return WorkHourStruct(title: "Total", value: totalInterval.toString()!)
    }
}