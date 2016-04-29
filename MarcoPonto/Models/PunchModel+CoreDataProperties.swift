import Foundation
import CoreData

extension PunchModel {

    @NSManaged var punchId: NSNumber?
    @NSManaged var punchImage: NSData?
    @NSManaged var punchMoment: NSDate?
    @NSManaged var punchType: NSNumber?

}
