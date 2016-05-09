import Foundation

public extension Double {
    public func toDays() -> Int {
        let hoursInDay = 24.0, minutesInHour = 60.0, secondsInMinutes = 60.0
        return Int(self/hoursInDay/minutesInHour/secondsInMinutes)
    }
}
