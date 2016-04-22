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
    private var gateway: PunchGateway
    private var presenter: CurrentWeekHoursPresenter
    private let firstDate = NSDate().startOf(NSCalendarUnit.WeekOfYear)
    private let lastDate = NSDate().endOf(NSCalendarUnit.WeekOfYear)
    
    init(gateway: PunchGateway, presenter: CurrentWeekHoursPresenter) {
        self.gateway = gateway
        self.presenter = presenter
    }
    
    func total() {
        let inputPunchs = gateway.list(by: .Input, between: firstDate, and: lastDate)
        let outputPunchs = gateway.list(by: .Output, between: firstDate, and: lastDate)
        var totalInterval = 0.0
        
        for (index, inputPunch) in inputPunchs.enumerate() {
            if existPunch(at: index, on: outputPunchs) {
                let ouputPunch = outputPunchs[index]
                totalInterval += ouputPunch.moment.timeIntervalSinceDate(inputPunch.moment)
                if isOutputPunchGreatherThanInputPunch(totalInterval) {
                    totalInterval = 0
                }
            }
        }

        presenter.showTotal(totalInterval)
    }
    
    private func existPunch(at index: Int, on punchs: [Punch]) -> Bool {
        return index <= punchs.count-1
    }
    
    private func isOutputPunchGreatherThanInputPunch(totalInterval: Double) -> Bool {
        return totalInterval < 0
    }
    
}