//
//  SaveAppointmentUsecase.swift
//  MarcoPonto
//
//  Created by Ronan Rodrigo Nunes on 16/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import Foundation

class SaveAppointmentUsecase {
    var gateway: AppointmentGateway
    
    init(gateway: AppointmentGateway) {
        self.gateway = gateway
    }
    
    func save(appointment: Appointment) {
        if appointment.isNewAppointment() {
            gateway.create(appointment)
        } else {
            gateway.update(appointment)
        }
    }
}