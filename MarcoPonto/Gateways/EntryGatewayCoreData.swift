//
//  EntryGatewayCoreData.swift
//  MarcoPonto
//
//  Created by Ronan Rodrigo Nunes on 17/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class EntryGatewayCoreData: EntryGateway {
    var entityName = "EntryModel"
    var app: AppDelegate
    var context: NSManagedObjectContext
    
    init() {
        app = UIApplication.sharedApplication().delegate as! AppDelegate
        context = app.managedObjectContext
    }
    
    func create(entry: Entry) {
        let entity = NSEntityDescription.entityForName(entityName, inManagedObjectContext: context)!
        let entryModel = EntryModel(entity: entity, insertIntoManagedObjectContext: context)
        entryModel.type = entry.type
        entryModel.moment = entry.moment
        context.insertObject(entryModel)
        
        do {
            try context.save()
        } catch {
            print("Could not save recipe")
        }
    }
    
    func update(entry: Entry) {
    }
    
    func list() -> [Entry] {
        let fetchRequest  = NSFetchRequest(entityName: entityName)
        do {
            let results = try context.executeFetchRequest(fetchRequest)
            return results.map({ $0 as! EntryModel })
        } catch {
            return []
        }
    }
}