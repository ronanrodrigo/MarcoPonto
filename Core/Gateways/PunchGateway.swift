import Foundation

protocol PunchGateway {
    func create(punch: Punch)
    func update(punch: Punch)
    func delete(punch: Punch)
    func list() -> [Punch]
    func list(type: PunchType, dateRange: (firstDate: NSDate, lastDate: NSDate)) -> [Punch]
}
