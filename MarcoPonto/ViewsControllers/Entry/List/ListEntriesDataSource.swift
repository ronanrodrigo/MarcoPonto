//
//  ListEntriesDataSource.swift
//  MarcoPonto
//
//  Created by Ronan Rodrigo Nunes on 17/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import Foundation
import UIKit

class EntryGatewayTemp: EntryGateway {
    func create(entry: Entry) {}
    func update(entry: Entry) {}
    func list() -> [Entry] {
        let entry = EntryStruct(id: 1, type: .Input, moment: NSDate())
        return [entry,entry,entry]
    }
}

class ListEntriesDataSource: NSObject, UITableViewDataSource, ListEntriesPresenter {
    let cellIdentifier = String(ListEntriesTableViewCell)
    var entries: [Entry] = []
    
    override init() {
        super.init()
        let usecase = ListEntriesUsecase(gateway: EntryGatewayTemp(), presenter: self)
        usecase.list()
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