//
//  TotalHour.swift
//  MarcoPonto
//
//  Created by Ronan Rodrigo Nunes on 22/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import Foundation

protocol WorkHourGroup {
    var title: String { get set }
    var workHours: [WorkHour] { get set }
}

struct WorkHourGroupStruct: WorkHourGroup {
    var title: String
    var workHours: [WorkHour]
}
