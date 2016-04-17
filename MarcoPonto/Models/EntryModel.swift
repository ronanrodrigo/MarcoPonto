//
//  EntryModel.swift
//  
//
//  Created by Ronan Rodrigo Nunes on 17/04/16.
//
//

import Foundation
import CoreData


class EntryModel: NSManagedObject, Entry {

    var moment: NSDate {
        get {
            return entryMoment ?? NSDate()
        } set {
            entryMoment = newValue
        }
    }
    
    var type: EntryType {
        get {
            return EntryType(rawValue: entryType ?? 1)!
        } set {
            entryType = newValue.rawValue
        }
    }
    
    var id: Int? {
        get {
            return entryId as Int?
        } set {
            entryId = newValue
        }
    }
    
    func isNewEntry() -> Bool {
        return id == nil
    }
    
}
