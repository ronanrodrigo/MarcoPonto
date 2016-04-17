//
//  ListEntriesUsecase.swift
//  MarcoPonto
//
//  Created by Ronan Rodrigo Nunes on 17/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import Foundation

class ListEntriesUsecase {
    var gateway: EntryGateway
    
    init(gateway: EntryGateway) {
        self.gateway = gateway
    }
    
    func list() {
        self.gateway.list()
    }
}
