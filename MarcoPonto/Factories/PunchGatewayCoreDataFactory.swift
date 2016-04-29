import Foundation
import UIKit
import CoreData

class PunchGatewayCoreDataFactory {
    static func make() -> PunchGatewayCoreData {
        if let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate {
            return PunchGatewayCoreData(appDelegate: appDelegate)
        } else {
            return PunchGatewayCoreData(appDelegate: AppDelegate())
        }

    }
}
