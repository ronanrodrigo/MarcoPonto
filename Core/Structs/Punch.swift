//
import Foundation

protocol Punch {
    var identifier: Int? { get set }
    var moment: NSDate { get set }
    var type: PunchType { get set }
    func isNewPunch() -> Bool
}

struct PunchStruct: Punch {
    var identifier: Int?
    var type: PunchType
    var moment: NSDate

    func isNewPunch() -> Bool {
        return identifier == nil
    }
}
