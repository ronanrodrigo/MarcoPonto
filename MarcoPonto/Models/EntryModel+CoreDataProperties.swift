//
//  EntryModel+CoreDataProperties.swift
//  MarcoPonto
//
//  Created by Ronan Rodrigo Nunes on 17/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension EntryModel {

    @NSManaged var entryMoment: NSDate?
    @NSManaged var entryType: NSNumber?
    @NSManaged var entryImage: NSData?
    @NSManaged var entryId: NSNumber?

}
