import Foundation

enum FacebookGatewayException: ErrorType {
    case Error
}

class FacebookGatewaySpy: FacebookGateway {
    var loginSpied = false
    var raiseException = false

    func login() throws {
        if raiseException {
            throw FacebookGatewayException.Error
        }
        loginSpied = true
    }
}
