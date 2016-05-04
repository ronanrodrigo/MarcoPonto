import Foundation

public enum WorkHourType {
    case PastWeek, CurrentWeek, PastMonth, CurrentMonth, All

    public static var types: [WorkHourType] {
        return [.PastWeek, .CurrentWeek, .PastMonth, .CurrentMonth, .All]
    }

    public var title: String {
        switch self {
            case .PastWeek: return "Semana passada"
            case .CurrentWeek: return "Semana atual"
            case .PastMonth: return "Mês passado"
            case .CurrentMonth: return "Mês atual"
            case .All: return "Tudo"
        }
    }

    public var dateRange: (firstDate: NSDate, lastDate: NSDate) {
        switch self {
            case .PastWeek: return NSDate.pastWeek
            case .CurrentWeek: return NSDate.currentWeek
            case .PastMonth: return NSDate.pastMonth
            case .CurrentMonth: return NSDate.currentMonth
            case .All: return NSDate.fromBeginning
        }
    }
}
