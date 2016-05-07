import Foundation

public protocol WorkHour {
    var type: WorkHourType { get set }
    var total: NSTimeInterval { get set }
    var balance: NSTimeInterval { get set }
}

public struct WorkHourStruct: WorkHour {
    public var type: WorkHourType
    public var total: NSTimeInterval
    public var balance: NSTimeInterval
}
