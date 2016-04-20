//
//  PunchGateway.swift
//  MarcoPonto
//
//  Created by Ronan Rodrigo Nunes on 16/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import Foundation

protocol PunchGateway {
    func create(punch: Punch)
    func update(punch: Punch)
    func delete(punch: Punch)
    func list() -> [Punch]
    func list(by type: PunchType, firstDate: NSDate, lastDate: NSDate) -> [Punch]
}