import Foundation

public protocol PunchGateway {
    func create(punch: Punch) -> Punch
    func update(punch: Punch) -> Punch
    func delete(punch: Punch)
    func list() -> [Punch]
    func list(type: PunchType, dateRange: (firstDate: NSDate, lastDate: NSDate)) -> [Punch]
}
