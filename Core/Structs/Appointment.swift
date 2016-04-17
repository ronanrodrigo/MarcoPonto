//
//  Appointment.swift
//  MarcoPonto
//
//  Created by Ronan Rodrigo Nunes on 16/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import Foundation

protocol Appointment {
    var moment: NSDate { get set }
    func isNewAppointment() -> Bool
}

struct AppointmentStruct: Appointment {
    var id: Int?
    var moment: NSDate
    
    init (moment: NSDate) {
        self.moment = moment
    }
    
    init (id: Int, moment: NSDate) {
        self.id = id
        self.moment = moment
    }
    
    func isNewAppointment() -> Bool {
        return id == nil
    }
}