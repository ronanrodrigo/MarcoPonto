//
//  SaveEntryUsecase.swift
//  MarcoPonto
//
//  Created by Ronan Rodrigo Nunes on 16/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import Foundation

class SaveEntryUsecase {
    var gateway: EntryGateway
    
    init(gateway: EntryGateway) {
        self.gateway = gateway
    }
    
    func save(entry: Entry) {
        if entry.isNewEntry() {
            gateway.create(entry)
        } else {
            gateway.update(entry)
        }
    }
}