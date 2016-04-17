//
//  FormEntryTableViewDataSource.swift
//  MarcoPonto
//
//  Created by Ronan Rodrigo Nunes on 16/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import Foundation
import UIKit

class FormEntryDataSource:  NSObject, UITableViewDataSource {

    let formEntryFields = [String(SelectTypeTableViewCell), String(SelectMomentTableViewCell)]
    var selectTypeTableViewCell: SelectTypeTableViewCell!
    var selectMomentTableViewCell: SelectMomentTableViewCell!
    
    override init() {
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return formEntryFields.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let field = formEntryFields[indexPath.row]
        tableView.rowHeight = UITableViewAutomaticDimension
        switch field {
        case String(SelectTypeTableViewCell):
            if let cell = tableView.dequeueReusableCellWithIdentifier(field) as? SelectTypeTableViewCell {
                selectTypeTableViewCell = cell
                return cell
            } else {
                return SelectTypeTableViewCell()
            }
        default:
            if let cell = tableView.dequeueReusableCellWithIdentifier(field) as? SelectMomentTableViewCell {
                selectMomentTableViewCell = cell
                return cell
            } else {
                return SelectMomentTableViewCell()
            }
        }
    }
    
    func filledEntry() -> Entry {
        let entryType = EntryType(rawValue: selectTypeTableViewCell.typeSelector.selectedSegmentIndex)!
        let moment = selectMomentTableViewCell.momentSelector.date
        return EntryStruct(id: nil, type: entryType, moment: moment)
    }
    
}