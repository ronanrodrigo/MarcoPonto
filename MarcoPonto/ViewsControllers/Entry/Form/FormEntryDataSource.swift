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
    var entry: Entry?
    
    init(entry: Entry?) {
        self.entry = entry
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return formEntryFields.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        tableView.rowHeight = UITableViewAutomaticDimension

        let field = formEntryFields[indexPath.row]
        switch field {
        case String(SelectTypeTableViewCell):
            guard let cell = tableView.dequeueReusableCellWithIdentifier(field) as? SelectTypeTableViewCell
                else { return SelectTypeTableViewCell() }
            selectTypeTableViewCell = cell
            selectTypeTableViewCell.fillData(self.entry?.type)
            return selectTypeTableViewCell
        default:
            guard let cell = tableView.dequeueReusableCellWithIdentifier(field) as? SelectMomentTableViewCell
                else { return SelectMomentTableViewCell() }
            selectMomentTableViewCell = cell
            selectMomentTableViewCell.fillData(self.entry?.moment)
            return selectMomentTableViewCell
        }
    }
    
    func filledEntry() -> Entry {
        let entryType = EntryType(rawValue: selectTypeTableViewCell.typeSelector.selectedSegmentIndex)!
        let moment = selectMomentTableViewCell.momentSelector.date
        return EntryStruct(id: entry?.id, type: entryType, moment: moment)
    }
    
}