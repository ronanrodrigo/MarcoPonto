//
//  AppointmentGateway.swift
//  MarcoPonto
//
//  Created by Ronan Rodrigo Nunes on 16/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import Foundation

protocol AppointmentGateway {
    func create(appointment: Appointment)
    func update(appointment: Appointment)
}