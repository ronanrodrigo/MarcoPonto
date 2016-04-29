import Foundation
import CoreData


class PunchModel: NSManagedObject, Punch {

    var moment: NSDate {
        get {
            return punchMoment ?? NSDate()
        } set {
            punchMoment = newValue
        }
    }

    var type: PunchType {
        get {
            return PunchType(rawValue: punchType ?? 1)!
        } set {
            punchType = newValue.rawValue
        }
    }

    var identifier: Int? {
        get {
            return punchId as Int?
        } set {
            punchId = newValue
        }
    }

    func isNewPunch() -> Bool {
        return identifier == nil
    }

}
