import Foundation

enum WorkHourType {
    case PastWeek, CurrentWeek, PastMonth, CurrentMonth, All

    var title: String {
        get {
            switch self {
                case .PastWeek: return "Semana passada"
                case .CurrentWeek: return "Semana atual"
                case .PastMonth: return "Mês passado"
                case .CurrentMonth: return "Mês atual"
                case .All: return "Tudo"
            }
        }
    }
}
