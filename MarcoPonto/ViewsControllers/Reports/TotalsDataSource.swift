//
//  TotalsDataSource.swift
//  MarcoPonto
//
//  Created by Ronan Rodrigo Nunes on 22/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import Foundation
import UIKit

class TotalsDataSource: NSObject, UITableViewDataSource, CurrentWeekHoursPresenter {
    var workHourGroups: [WorkHourGroup] = []
    var cellIdentifier: String = "WorkHoursReports"
    
    override init() {
        super.init()
        CurrentWeekHoursUsecaseFactory.make(self).total()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return workHourGroups.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workHourGroups[section].workHours.count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let workHoursReport = workHourGroups[section]
        return workHoursReport.title
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: cellIdentifier)
        
        let workHourGroup = workHourGroups[indexPath.section]
        let workHour = workHourGroup.workHours[indexPath.row]
        cell.textLabel?.text = workHour.title
        cell.detailTextLabel?.text = workHour.value
        cell.userInteractionEnabled = false
        
        return cell
    }
    
    func showTotal(workHoursReport: WorkHourGroup) {
        workHourGroups.append(workHoursReport)
    }
}