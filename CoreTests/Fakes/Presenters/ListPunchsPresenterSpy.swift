//
//  ListPunchsPresenterSpy.swift
//  MarcoPonto
//
//  Created by Ronan Rodrigo Nunes on 17/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import Foundation

class ListPunchsPresenterSpy: ListPunchsPresenter {
    var listSpied = false
    
    func list(punchs: [Punch]) {
        listSpied = true
    }
}
