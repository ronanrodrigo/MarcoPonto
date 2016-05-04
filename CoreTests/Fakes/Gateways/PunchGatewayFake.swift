import Foundation
import SwiftDate

class PunchGatewayFake: PunchGateway {
    var punchs: [Punch] = []
    var listSpied = false

    func create(punch: Punch) {
        punchs.append(punch)
    }

    func update(punch: Punch) { }

    func delete(punch: Punch) { }

    func list() -> [Punch] {
        return punchs
    }

    func list(type: PunchType, dateRange: (firstDate: NSDate, lastDate: NSDate)) -> [Punch] {
        listSpied = true
        return punchs.filter { (punch) -> Bool in
            punch.type == type && punch.moment >= dateRange.firstDate && punch.moment <= dateRange.lastDate
        }
    }
}
