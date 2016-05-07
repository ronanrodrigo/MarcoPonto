import Foundation

public protocol Punch {
    var id: Int? { get set }
    var moment: NSDate { get set }
    var type: PunchType { get set }
    func isNewPunch() -> Bool
}

public struct PunchStruct: Punch {
    public var id: Int?
    public var type: PunchType
    public var moment: NSDate

    public init(id: Int?, type: PunchType, moment: NSDate) {
        self.id = id
        self.type = type
        self.moment = moment
    }

    public func isNewPunch() -> Bool {
        return id == nil
    }
}
