import Foundation

class PunchGatewaySpy: PunchGateway {
    var createSpied = false
    var updateSpied = false
    var listSpied = false
    var listBySpied = false
    var listByDay = false
    var listSpieds: [Bool] = []

    func create(punch: Punch) -> Punch {
        createSpied = true
        return punch
    }

    func update(punch: Punch) -> Punch {
        updateSpied = true
        return punch
    }

    func delete(punch: Punch) { }

    func list() -> [Punch] {
        listSpied = true
        listSpieds.append(listSpied)
        return []
    }

    func list(type: PunchType, dateRange: (firstDate: NSDate, lastDate: NSDate)) -> [Punch] {
        listBySpied = true
        listSpieds.append(listSpied)
        return []
    }

    func list(day: NSDate) -> [Punch] {
        listByDay = true
        listSpieds.append(listSpied)
        return []
    }

}
