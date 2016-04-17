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
            return self.moment_ ?? NSDate()
        } set {
            self.moment_ = newValue
        }
    }
    
    var type: EntryType {
        get {
            return EntryType(rawValue: self.type_ ?? 1)!
        } set {
            self.type_ = newValue.rawValue
        }
    }
    
    func isNewEntry() -> Bool {
        return true
    }
    
}
