//
//  TotalsDataSource.swift
//  MarcoPonto
//
//  Created by Ronan Rodrigo Nunes on 22/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import Foundation
import UIKit

class TotalsDataSource: NSObject, UITableViewDataSource, WorkedHoursPresenter {
    var workHours: [WorkHour] = []
    var cellIdentifier: String = "WorkHoursReports"
    
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
        return workHoursReport.title
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: cellIdentifier)
        
        let workHour = workHours[indexPath.section]
        cell.textLabel?.text = "Total"
        cell.detailTextLabel?.text = workHour.total.toTimeString()
        cell.userInteractionEnabled = false
        
        return cell
    }
    
    func showTotal(workHour: WorkHour) {
        workHours.append(workHour)
    }
}