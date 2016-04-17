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
    var type: EntryType { get set }
    func isNewEntry() -> Bool
}

struct EntryStruct: Entry {
    var id: Int?
    var type: EntryType
    var moment: NSDate
    
    func isNewEntry() -> Bool {
        return id == nil
    }
}