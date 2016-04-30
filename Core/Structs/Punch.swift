import Foundation

protocol Punch {
    var id: Int? { get set }
    var moment: NSDate { get set }
    var type: PunchType { get set }
    func isNewPunch() -> Bool
}

struct PunchStruct: Punch {
    var id: Int?
    var type: PunchType
    var moment: NSDate

    func isNewPunch() -> Bool {
        return id == nil
    }
}
