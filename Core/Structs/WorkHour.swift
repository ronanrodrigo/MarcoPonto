import Foundation

protocol WorkHour {
    var title: String { get set }
    var total: NSTimeInterval { get set }
}

struct WorkHourStruct: WorkHour {
    var title: String
    var total: NSTimeInterval
}
