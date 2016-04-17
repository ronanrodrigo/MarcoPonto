//
//  ListEntriesDataSource.swift
//  MarcoPonto
//
//  Created by Ronan Rodrigo Nunes on 17/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import Foundation
import UIKit

class ListEntriesDataSource: NSObject, UITableViewDataSource, ListEntriesPresenter {
    let cellIdentifier = String(ListEntriesTableViewCell)
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? ListEntriesTableViewCell {
            return cell
        } else {
            return ListEntriesTableViewCell()
        }
    }
    
    func list(entries: [Entry]) {
        self.entries = entries
    }
}