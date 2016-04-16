//
//  FormAppointmentTableViewDataSource.swift
//  MarcoPonto
//
//  Created by Ronan Rodrigo Nunes on 16/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import Foundation
import UIKit

class FormAppointmentTableViewDataSource:  NSObject, UITableViewDataSource {

    let identifier = String(SelectDateTableViewCell)
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier(identifier) as? SelectDateTableViewCell {
            return cell
        } else {
            return SelectDateTableViewCell()
        }
    }
    
}