import Foundation

public extension NSTimeInterval {
    public func toTimeString() -> String {
        let interval = Int(self)
        let seconds = interval % 60
        let minutes = (interval / 60) % 60
        let hours = (interval / 3600)
        return String(format: "%02dh %02dm", hours, abs(minutes), abs(seconds))
    }
}
