//
//  WorkedHoursPresenterFake.swift
//  MarcoPonto
//
//  Created by Ronan Rodrigo Nunes on 20/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import Foundation

class WorkedHoursPresenterFake: WorkedHoursPresenter {
    var workHours: [WorkHour] = []
    
    func showTotal(workHour: WorkHour) {
        workHours.append(workHour)
    }
}
