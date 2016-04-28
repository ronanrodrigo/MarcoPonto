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
    private var presenter: WeekWorkedHoursPresenter
    
    init(gateway: PunchGateway, presenter: WeekWorkedHoursPresenter) {
        self.gateway = gateway
        self.presenter = presenter
    }
    
    func total() {
        let total = totalHours(between: NSDate(), and: NSDate())
        let currentWeekHours = WorkHourStruct(title: "Semana atual", total: total)
    }
    
    private func totalHours(between firstDate: NSDate, and lastDate: NSDate) -> NSTimeInterval {
        let inputPunchs = gateway.list(by: .Input, between: firstDate, and: lastDate)
        let outputPunchs = gateway.list(by: .Output, between: firstDate, and: lastDate)
        let totalInterval = WorkedHoursEntity(inputPunchs: inputPunchs, outputPunchs: outputPunchs).calculate()
        return totalInterval
    }
}