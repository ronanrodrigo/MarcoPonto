import Foundation

enum PunchType: NSNumber {
    case Input = 0, Output = 1
    
    func description() -> String {
        switch self {
        case .Input:
            return "Entrada"
        default:
            return "Saída"
        }
    }
}
