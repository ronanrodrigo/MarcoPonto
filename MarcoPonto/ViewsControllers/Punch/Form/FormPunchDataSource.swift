import Foundation
import UIKit

class FormPunchDataSource:  NSObject, UITableViewDataSource {

    private let formPunchFields = [String(SelectTypeTableViewCell), String(SelectMomentTableViewCell)]
    private var selectTypeTableViewCell: SelectTypeTableViewCell!
    private var selectMomentTableViewCell: SelectMomentTableViewCell!
    private var punch: Punch?
    
    init(punch: Punch?) {
        self.punch = punch
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return formPunchFields.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        tableView.rowHeight = UITableViewAutomaticDimension

        let field = formPunchFields[indexPath.row]
        switch field {
        case String(SelectTypeTableViewCell):
            guard let cell = tableView.dequeueReusableCellWithIdentifier(field) as? SelectTypeTableViewCell
                else { return SelectTypeTableViewCell() }
            selectTypeTableViewCell = cell
            selectTypeTableViewCell.fillData(self.punch?.type)
            return selectTypeTableViewCell
        default:
            guard let cell = tableView.dequeueReusableCellWithIdentifier(field) as? SelectMomentTableViewCell
                else { return SelectMomentTableViewCell() }
            selectMomentTableViewCell = cell
            selectMomentTableViewCell.fillData(self.punch?.moment)
            return selectMomentTableViewCell
        }
    }
    
    func filledPunch() -> Punch {
        let punchType = PunchType(rawValue: selectTypeTableViewCell.typeSelector.selectedSegmentIndex)!
        let moment = selectMomentTableViewCell.momentSelector.date
        return PunchStruct(id: punch?.id, type: punchType, moment: moment)
    }
    
}