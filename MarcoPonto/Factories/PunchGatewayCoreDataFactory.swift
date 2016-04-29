import Foundation
import UIKit
import CoreData

class PunchGatewayCoreDataFactory {
    static func make() -> PunchGatewayCoreData {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        return PunchGatewayCoreData(appDelegate: appDelegate)
    }
}
