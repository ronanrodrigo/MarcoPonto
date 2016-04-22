//
//  PunchGatewayCoreDataFactory.swift
//  MarcoPonto
//
//  Created by Ronan Rodrigo Nunes on 17/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class PunchGatewayCoreDataFactory {
    static func make() -> PunchGatewayCoreData {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        return PunchGatewayCoreData(appDelegate: appDelegate)
    }
}
