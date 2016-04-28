//
//  NSTimeInterval+ToString.swift
//  MarcoPonto
//
//  Created by Ronan Rodrigo Nunes on 28/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import Foundation

extension NSTimeInterval {
    func toTimeString() -> String {
        let interval = Int(self)
        let seconds = interval % 60
        let minutes = (interval / 60) % 60
        let hours = (interval / 3600)
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
}