//
//  WeekHoursUsecase.swift
//  MarcoPonto
//
//  Created by Ronan Rodrigo Nunes on 19/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import Foundation

class CurrentWeekHoursUsecase {
    var gateway: PunchGateway
    var presenter: CurrentWeekHoursPresenter
    
    init(gateway: PunchGateway, presenter: CurrentWeekHoursPresenter) {
        self.gateway = gateway
        self.presenter = presenter
    }
    
    func total() {
        let firstMoment = gateway.list()[0].moment
        let secondMoment = gateway.list()[1].moment
        let timeInterval = firstMoment.timeIntervalSinceReferenceDate
        let interval = secondMoment.timeIntervalSinceDate(firstMoment)

        presenter.showTotal(interval)
    }
    
}