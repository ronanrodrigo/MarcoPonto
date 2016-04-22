//
//  CurrentWeekHoursPresenterFake.swift
//  MarcoPonto
//
//  Created by Ronan Rodrigo Nunes on 20/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import Foundation

class CurrentWeekHoursPresenterFake: CurrentWeekHoursPresenter {
    var workHourGroup: WorkHourGroup?
    
    func showTotal(workHourGroup: WorkHourGroup) {
        self.workHourGroup = workHourGroup
    }

}
