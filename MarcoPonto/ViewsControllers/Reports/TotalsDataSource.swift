import Foundation
import UIKit

class TotalsDataSource: NSObject, UITableViewDataSource, WorkedHoursPresenter {
    var workHours: [WorkHour] = []
    var cellIdentifier: String = "WorkHoursReportsCell"

    override init() {
        super.init()
        CurrentWeekHoursUsecaseFactory.make(self).total()
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return workHours.count
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let workHoursReport = workHours[section]
        return workHoursReport.type.title
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: cellIdentifier)

        let workHour = workHours[indexPath.section]
        cell.textLabel?.text = workHour.balance.toTimeString()
        cell.detailTextLabel?.text = workHour.total.toTimeString()
        cell.userInteractionEnabled = false

        return cell
    }

    func showTotal(workHours: [WorkHour]) {
        self.workHours = workHours
    }
}
