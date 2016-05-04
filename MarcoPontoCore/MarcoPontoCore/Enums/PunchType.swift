import Foundation

public enum PunchType: NSNumber {
    case Input = 0, Output = 1

    public var title: String {
        get {
            switch self {
                case .Input: return "Entrada"
                case .Output: return "Saída"
            }
        }
    }
}
