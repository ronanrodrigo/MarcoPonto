//
//  WorkHour.swift
//  MarcoPonto
//
//  Created by Ronan Rodrigo Nunes on 22/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import Foundation

protocol WorkHour {
    var title: String { get set }
    var total: NSTimeInterval { get set }
}

struct WorkHourStruct: WorkHour {
    var title: String
    var total: NSTimeInterval
}
