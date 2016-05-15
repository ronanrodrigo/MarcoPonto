import Foundation

class PunchGatewayFake: PunchGateway {
    var punchs: [Punch] = []
    var listSpied = false

    func create(punch: Punch) -> Punch {
        punchs.append(punch)
        return punch
    }

    func update(punch: Punch) -> Punch {
        return punch
    }

    func delete(punch: Punch) {
    }

    func list() -> [Punch] {
        return punchs
    }

    func list(day: NSDate) -> [Punch] {
        return punchs
    }

    func list(type: PunchType, dateRange: (firstDate: NSDate, lastDate: NSDate)) -> [Punch] {
        listSpied = true
        return punchs.filter { (punch) -> Bool in
            punch.type == type && punch.moment >= dateRange.firstDate && punch.moment <= dateRange.lastDate
        }
    }
}
