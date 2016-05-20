import Foundation
import UIKit
import CoreData
import SwiftDate
import MarcoPontoCore

class PunchGatewayCoreData: PunchGateway {
    var entityName = String(PunchModel)
    var app: AppDelegate
    var context: NSManagedObjectContext
    var momentSortDescriptor: NSSortDescriptor
    var typeSortDescriptor: NSSortDescriptor
    var idSortDescriptor: NSSortDescriptor

    init(appDelegate: AppDelegate) {
        app = appDelegate
        context = app.managedObjectContext
        momentSortDescriptor = NSSortDescriptor(key: "punchMoment", ascending: true)
        typeSortDescriptor = NSSortDescriptor(key: "punchType", ascending: true)
        idSortDescriptor = NSSortDescriptor(key: "punchId", ascending: false)
    }

    func create(punch: Punch) -> Punch {
        let entity = NSEntityDescription.entityForName(entityName, inManagedObjectContext: context)!
        let punchModel = PunchModel(entity: entity, insertIntoManagedObjectContext: context)
        punchModel.type = punch.type
        punchModel.moment = NSDate(fromDate: punch.moment, second: 0, nanosecond: 0)
        punchModel.id = getLastId() + 1
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
        guard let punchId = punch.id
            else { return }
        fetchRequest.predicate =  NSPredicate(format: "punchId = %d", punchId)
        do {
            let results = try context.executeFetchRequest(fetchRequest)
            if let _punch = results.first as? PunchModel {
                context.deleteObject(_punch)
            }
            try context.save()
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
        fetchRequest.sortDescriptors = [momentSortDescriptor]
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

    func list(day: NSDate) -> [Punch] {
        let beginningOfDay = NSDate(fromDate: day, hour: 0, minute: 0, second: 1)
        let endOfDay = NSDate(fromDate: day, hour: 23, minute: 59, second: 59)
        let fetchRequest = NSFetchRequest(entityName: entityName)
        fetchRequest.sortDescriptors = [momentSortDescriptor, typeSortDescriptor]
        fetchRequest.predicate =  NSPredicate(
            format: "punchMoment >= %@ AND punchMoment <= %@", beginningOfDay, endOfDay)
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
        fetchRequest.sortDescriptors = [idSortDescriptor]
        var lastId = 0
        do {
            let results = try context.executeFetchRequest(fetchRequest)
            if let lastPunch = results.first as? Punch {
                lastId = lastPunch.id ?? 0
            }
        } catch {
            print("Could not get ID of \(entityName)")
        }
        return lastId
    }
}
