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

    @NSManaged var moment_: NSDate?
    @NSManaged var type_: NSNumber?
    @NSManaged var image_: NSData?

}
