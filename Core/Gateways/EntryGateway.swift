//
//  EntryGateway.swift
//  MarcoPonto
//
//  Created by Ronan Rodrigo Nunes on 16/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import Foundation

protocol EntryGateway {
    func create(entry: Entry)
    func update(entry: Entry)
}