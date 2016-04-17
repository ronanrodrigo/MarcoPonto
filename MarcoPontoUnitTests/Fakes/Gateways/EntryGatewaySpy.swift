//
//  EntryGatewaySpy.swift
//  MarcoPonto
//
//  Created by Ronan Rodrigo Nunes on 16/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import Foundation

class EntryGatewaySpy: EntryGateway {
    var createSpied = false
    var updateSpied = false
    var listSpied = false
    
    func create(entry: Entry) {
        createSpied = true
    }
    
    func update(entry: Entry) {
        updateSpied = true
    }
    
    func list() -> [Entry] {
        listSpied = true
        return []
    }
}
