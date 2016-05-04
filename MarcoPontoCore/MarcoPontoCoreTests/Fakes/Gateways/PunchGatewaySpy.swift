import Foundation

class PunchGatewaySpy: PunchGateway {
    var createSpied = false
    var updateSpied = false
    var listSpied = false
    var listBySpied = false
    var listSpieds: [Bool] = []

    func create(punch: Punch) {
        createSpied = true
    }

    func update(punch: Punch) {
        updateSpied = true
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
}
