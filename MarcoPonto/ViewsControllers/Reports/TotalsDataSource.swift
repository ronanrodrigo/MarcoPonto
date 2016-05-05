import Foundation
import UIKit
import MarcoPontoCore

class TotalsDataSource: NSObject, UITableViewDataSource, WorkedHoursPresenter {
    var workHours: [WorkHour] = []
    var cellIdentifier: String = String(WorkHoursTableViewCell)

    override init() {
        super.init()
        CurrentWeekHoursUsecaseFactory.make(self).workedHours()
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workHours.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? WorkHoursTableViewCell {
            cell.updateCell(workHours[indexPath.row])
            return cell
        } else {
            return WorkHoursTableViewCell()
        }
    }

    func showTotal(workHours: [WorkHour]) {
        self.workHours = workHours
    }
}
