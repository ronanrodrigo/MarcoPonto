//
//  PunchModel+CoreDataProperties.swift
//  MarcoPonto
//
//  Created by Ronan Rodrigo Nunes on 19/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension PunchModel {

    @NSManaged var punchId: NSNumber?
    @NSManaged var punchImage: NSData?
    @NSManaged var punchMoment: NSDate?
    @NSManaged var punchType: NSNumber?

}
