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
    var presenter: ListEntriesPresenter
    
    init(gateway: EntryGateway, presenter: ListEntriesPresenter) {
        self.gateway = gateway
        self.presenter = presenter
    }
    
    func list() {
        let entries = self.gateway.list()
        presenter.list(entries)
    }
}
