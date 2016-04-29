import Foundation
import UIKit

class ListPunchsDelegate: NSObject, UITableViewDelegate {

    private var navigationDelegate: INavigationDelgate

    init (navigationDelegate: INavigationDelgate) {
        self.navigationDelegate = navigationDelegate
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let cell = tableView.cellForRowAtIndexPath(indexPath) as? ListPunchsTableViewCell {
            if let _punch = cell.punch {
                navigationDelegate.editPunchFormViewController(_punch)
            }
        }
    }

    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath)
        -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.Delete
    }

    func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath)
        -> String? {
        return "Apagar"
    }
}
