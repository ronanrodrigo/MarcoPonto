import Foundation
import UIKit

class SettingsDataSource: NSObject, UITableViewDataSource {

    private var settingsInputs = [String(FacebookTableViewCell)]
    private var facebookTableViewCell: FacebookTableViewCell!

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsInputs.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let field = settingsInputs[indexPath.row]
        switch field {
            case String(FacebookTableViewCell):
                guard let cell = tableView.dequeueReusableCellWithIdentifier(field) as? FacebookTableViewCell else {
                    return FacebookTableViewCell() }
                facebookTableViewCell = cell
                return facebookTableViewCell
            default:
                return UITableViewCell()
        }
    }
}
