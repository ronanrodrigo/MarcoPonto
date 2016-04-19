//
//  PunchTipe.swift
//  MarcoPonto
//
//  Created by Ronan Rodrigo Nunes on 16/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import Foundation

enum PunchType: NSNumber {
    case Input = 0, Output = 1
    
    func description() -> String {
        switch self {
        case .Input:
            return "Entrada"
        default:
            return "Saída"
        }
    }
}
