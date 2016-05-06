import Foundation
import UIKit
import CoreData
import SwiftDate
import MarcoPontoCore

class PunchGatewayCoreData: PunchGateway {
    var entityName = String(PunchModel)
    var app: AppDelegate
    var context: NSManagedObjectContext
    var nextId: Int = 1
    var momentSortDescriptor: NSSortDescriptor
    var typeSortDescriptor: NSSortDescriptor

    init(appDelegate: AppDelegate) {
        app = appDelegate
        context = app.managedObjectContext
        momentSortDescriptor = NSSortDescriptor(key: "punchMoment", ascending: true)
        typeSortDescriptor = NSSortDescriptor(key: "punchType", ascending: true)
        nextId = getLastId() + 1
    }

    func create(punch: Punch) -> Punch {
        let entity = NSEntityDescription.entityForName(entityName, inManagedObjectContext: context)!
        let punchModel = PunchModel(entity: entity, insertIntoManagedObjectContext: context)
        punchModel.type = punch.type
        punchModel.moment = NSDate(fromDate: punch.moment, second: 0, nanosecond: 0)
        punchModel.id = nextId
        context.insertObject(punchModel)

        do {
            try context.save()
        } catch {
            print("Could not create \(entityName)")
        }
        return punchModel
    }

    func update(punch: Punch) -> Punch {
        let fetchRequest = NSFetchRequest(entityName: entityName)
        fetchRequest.predicate =  NSPredicate(format: "punchId = %d", punch.id!)
        do {
            let results = try context.executeFetchRequest(fetchRequest)
            if var _punch = results.first as? Punch {
                _punch.moment = NSDate(fromDate: punch.moment, second: 0, nanosecond: 0)
                _punch.type = punch.type
                try context.save()
                return _punch
            }
        } catch {
            print("Could not update \(entityName)")
        }
        return punch
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
        fetchRequest.sortDescriptors = [momentSortDescriptor, typeSortDescriptor]
        do {
            let results = try context.executeFetchRequest(fetchRequest)
            return punchList(results)
        } catch {
            return []
        }
    }

    func list(type: PunchType, dateRange: (firstDate: NSDate, lastDate: NSDate)) -> [Punch] {
        let fetchRequest = NSFetchRequest(entityName: entityName)
        fetchRequest.predicate =  NSPredicate(
            format: "punchType = %@ AND punchMoment >= %@ AND punchMoment <= %@",
            type.rawValue, dateRange.firstDate, dateRange.lastDate)
        do {
            let results = try context.executeFetchRequest(fetchRequest)
            return punchList(results)
        } catch {
            return []
        }
    }

    func punchList(results: [AnyObject]) -> [Punch] {
        var punchs: [Punch] = []
        for punch in results {
            if let _punch = punch as? PunchModel {
                punchs.append(_punch)
            }
        }
        return punchs
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
