import Foundation

enum PunchType: NSNumber {
    case Input = 0, Output = 1

    var title: String {
        get {
            switch self {
                case .Input: return "Entrada"
                case .Output: return "Saída"
            }
        }
    }
}
