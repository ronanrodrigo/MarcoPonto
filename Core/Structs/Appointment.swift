//
//  Entry.swift
//  MarcoPonto
//
//  Created by Ronan Rodrigo Nunes on 16/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import Foundation

protocol Entry {
    var moment: NSDate { get set }
    func isNewEntry() -> Bool
}

struct EntryStruct: Entry {
    var id: Int?
    var moment: NSDate
    
    init (moment: NSDate) {
        self.moment = moment
    }
    
    init (id: Int, moment: NSDate) {
        self.id = id
        self.moment = moment
    }
    
    func isNewEntry() -> Bool {
        return id == nil
    }
}