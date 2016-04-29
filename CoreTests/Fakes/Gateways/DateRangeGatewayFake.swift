//
// Created by Ronan Rodrigo Nunes on 29/04/16.
// Copyright (c) 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import Foundation

class DateRangeGatewayFake: DateRangeGateway {
    var pastWeekSpied = false
    var currentWeekSpied = false
    var pastMonthSpied = false
    var currentMonthSpied = false
    var fromBeginningSpied = false

    func pastWeek() -> (firstDate:NSDate, lastDate:NSDate) {
        pastWeekSpied = true
        return (firstDate: NSDate(), lastDate:NSDate())
    }

    func currentWeek() -> (firstDate:NSDate, lastDate:NSDate) {
        currentWeekSpied = true
        return (firstDate: NSDate(), lastDate:NSDate())
    }

    func pastMonth() -> (firstDate:NSDate, lastDate:NSDate) {
        pastMonthSpied = true
        return (firstDate: NSDate(), lastDate:NSDate())
    }

    func currentMonth() -> (firstDate:NSDate, lastDate:NSDate) {
        currentMonthSpied = true
        return (firstDate: NSDate(), lastDate:NSDate())
    }

    func fromBeginning() -> (firstDate:NSDate, lastDate:NSDate) {
        fromBeginningSpied = true
        return (firstDate: NSDate(), lastDate:NSDate())
    }
}
