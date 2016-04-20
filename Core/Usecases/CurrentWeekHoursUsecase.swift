//
//  WeekHoursUsecase.swift
//  MarcoPonto
//
//  Created by Ronan Rodrigo Nunes on 19/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import Foundation
import SwiftDate

class CurrentWeekHoursUsecase {
    var gateway: PunchGateway
    var presenter: CurrentWeekHoursPresenter
    
    init(gateway: PunchGateway, presenter: CurrentWeekHoursPresenter) {
        self.gateway = gateway
        self.presenter = presenter
    }
    
    func total() {
        let firstDate = NSDate().startOf(NSCalendarUnit.WeekOfYear)
        let lastDate = NSDate().endOf(NSCalendarUnit.WeekOfYear)
        
        let inputPunchs = gateway.list(by: .Input, firstDate: firstDate, lastDate: lastDate)
        let outputPunchs = gateway.list(by: .Output, firstDate: firstDate, lastDate: lastDate)
        var totalInterval = 0.0
        
        for (index, inputPunch) in inputPunchs.enumerate() {
            if index <= outputPunchs.count-1 {
                let ouputPunch = outputPunchs[index]
                totalInterval += ouputPunch.moment.timeIntervalSinceDate(inputPunch.moment)
                if totalInterval < 0 {
                    totalInterval = 0
                }
            }
        }

        presenter.showTotal(totalInterval)
    }
    
}