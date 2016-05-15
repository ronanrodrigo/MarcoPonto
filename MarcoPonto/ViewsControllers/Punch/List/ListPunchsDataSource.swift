import Foundation
import UIKit
import MarcoPontoCore

protocol RRNListDataSource: UITableViewDataSource {
    func removePunch(at indexPath: NSIndexPath)
}

class ListPunchsDataSource: NSObject, RRNListDataSource, ListPunchsPresenter {
    private let cellIdentifier = String(ListPunchsTableViewCell)
    private var editTableViewDelegate: EditTableViewDelegate!
    private var punchs: [Punch] = []

    init(editTableViewDelegate: EditTableViewDelegate, day: NSDate = NSDate()) {
        super.init()
        self.editTableViewDelegate = editTableViewDelegate
        ListPunchsUsecaseFactory.make(presenter: self).list(day)
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return punchs.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? ListPunchsTableViewCell {
            cell.updateCell(punchs[indexPath.row])
            return cell
        } else {
            return ListPunchsTableViewCell()
        }
    }

    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle,
                   forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            if let _editTableViewDelegate = editTableViewDelegate {
                _editTableViewDelegate.confirmDelete(punchs[indexPath.row], at: indexPath)
            }
        }
    }

    func removePunch(at indexPath: NSIndexPath) {
        PunchGatewayCoreDataFactory.make().delete(punchs[indexPath.row])
        punchs.removeAtIndex(indexPath.row)
    }

    func list(punchs: [Punch]) {
        self.punchs = punchs
    }
}
