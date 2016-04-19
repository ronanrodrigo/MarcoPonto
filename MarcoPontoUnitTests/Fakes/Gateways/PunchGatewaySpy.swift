//
//  PunchGatewaySpy.swift
//  MarcoPonto
//
//  Created by Ronan Rodrigo Nunes on 16/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import Foundation

class PunchGatewaySpy: PunchGateway {
    var createSpied = false
    var updateSpied = false
    var listSpied = false
    
    func create(punch: Punch) {
        createSpied = true
    }
    
    func update(punch: Punch) {
        updateSpied = true
    }
    
    func delete(punch: Punch) {
        
    }
    
    func list() -> [Punch] {
        listSpied = true
        return []
    }
}
