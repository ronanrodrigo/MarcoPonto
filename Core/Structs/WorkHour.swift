import Foundation

protocol WorkHour {
    var type: WorkHourType { get set }
    var total: NSTimeInterval { get set }
    var balance: NSTimeInterval { get set }
}

struct WorkHourStruct: WorkHour {
    var type: WorkHourType
    var total: NSTimeInterval
    var balance: NSTimeInterval
}
