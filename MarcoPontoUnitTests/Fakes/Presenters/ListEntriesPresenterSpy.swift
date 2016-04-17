//
//  ListEntriesPresenterSpy.swift
//  MarcoPonto
//
//  Created by Ronan Rodrigo Nunes on 17/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import Foundation

class ListEntriesPresenterSpy: ListEntriesPresenter {
    var listSpied = false
    
    func list(entries: [Entry]) {
        listSpied = true
    }
}
