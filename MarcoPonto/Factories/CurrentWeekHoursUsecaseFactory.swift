//
//  CurrentWeekHoursUsecaseFactory.swift
//  MarcoPonto
//
//  Created by Ronan Rodrigo Nunes on 22/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import Foundation

class CurrentWeekHoursUsecaseFactory {
    static func make(presenter: WeekWorkedHoursPresenter) -> WeekWorkedHoursUsecase {
        let gateway = PunchGatewayCoreDataFactory.make()
        return WeekWorkedHoursUsecase(gateway: gateway, presenter: presenter)
    }
}