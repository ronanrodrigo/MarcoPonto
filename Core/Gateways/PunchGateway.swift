import Foundation

protocol PunchGateway {
    func create(punch: Punch)
    func update(punch: Punch)
    func delete(punch: Punch)
    func list() -> [Punch]
    func list(by type: PunchType, between firstDate: NSDate, and lastDate: NSDate) -> [Punch]
}