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
    var entries: [Entry] = []
    
    override init() {
        super.init()
        ListEntriesUsecaseFactory.make(presenter: self).list()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entries.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? ListEntriesTableViewCell {
            cell.updateCell(entries[indexPath.row])
            return cell
        } else {
            return ListEntriesTableViewCell()
        }
    }
    
    func list(entries: [Entry]) {
        self.entries = entries
    }
}