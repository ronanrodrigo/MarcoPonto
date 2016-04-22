//
//  PunchGatewayCoreData.swift
//  MarcoPonto
//
//  Created by Ronan Rodrigo Nunes on 17/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class PunchGatewayCoreData: PunchGateway {
    var entityName = String(PunchModel)
    var app: AppDelegate
    var context: NSManagedObjectContext
    var nextId: Int = 1
    
    init(appDelegate: AppDelegate) {
        app = appDelegate
        context = app.managedObjectContext
        nextId = self.getLastId() + 1
    }
    
    func create(punch: Punch) {
        let entity = NSEntityDescription.entityForName(entityName, inManagedObjectContext: context)!
        let punchModel = PunchModel(entity: entity, insertIntoManagedObjectContext: context)
        punchModel.type = punch.type
        punchModel.moment = punch.moment
        punchModel.id = nextId
        context.insertObject(punchModel)
        
        do {
            try context.save()
        } catch {
            print("Could not create \(entityName)")
        }
    }
    
    func update(punch: Punch) {
        let fetchRequest = NSFetchRequest(entityName: entityName)
        fetchRequest.predicate =  NSPredicate(format: "punchId = %d", punch.id!)
        do {
            let results = try context.executeFetchRequest(fetchRequest)
            if var _punch = results.first as? Punch {
                _punch.moment = punch.moment
                _punch.type = punch.type
                try context.save()
            }
        } catch {
            print("Could not update \(entityName)")
        }
    }
    
    func delete(punch: Punch) {
        let fetchRequest = NSFetchRequest(entityName: entityName)
        fetchRequest.predicate =  NSPredicate(format: "punchId = %d", punch.id!)
        do {
            let results = try context.executeFetchRequest(fetchRequest)
            if let _punch = results.first as? PunchModel {
                context.deleteObject(_punch)
            }
        } catch {
            print("Could not update \(entityName)")
        }
    }
    
    func list() -> [Punch] {
        let fetchRequest = NSFetchRequest(entityName: entityName)
        do {
            let results = try context.executeFetchRequest(fetchRequest)
            return results.map({ $0 as! PunchModel })
        } catch {
            return []
        }
    }
    
    func list(by type: PunchType, between firstDate: NSDate, and lastDate: NSDate) -> [Punch] {
        let fetchRequest = NSFetchRequest(entityName: entityName)
        fetchRequest.predicate =  NSPredicate(format: "moment >= %@ and moment <= %@", firstDate, lastDate)
        do {
            let results = try context.executeFetchRequest(fetchRequest)
            return results.map({ $0 as! PunchModel })
        } catch {
            return []
        }
    }
    
    func getLastId() -> Int {
        let fetchRequest  = NSFetchRequest(entityName: entityName)
        var lastId = 0
        do {
            let results = try context.executeFetchRequest(fetchRequest)
            if let lastPunch = results.last as? Punch {
                lastId = lastPunch.id ?? 0
            }
        } catch {
            print("Could not get ID of \(entityName)")
        }
        return lastId
    }
}