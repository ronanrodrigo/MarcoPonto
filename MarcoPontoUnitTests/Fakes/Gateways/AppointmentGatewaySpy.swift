//
//  AppointmentGatewaySpy.swift
//  MarcoPonto
//
//  Created by Ronan Rodrigo Nunes on 16/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import Foundation

class AppointmentGatewaySpy: AppointmentGateway {
    var createSpied = false
    var updateSpied = false
    
    func create(appointment: Appointment) {
        createSpied = true
    }
    
    func update(appointment: Appointment) {
        updateSpied = true
    }
}
