//
//  WeekWorkedHoursUsecaseTests.swift
//  MarcoPonto
//
//  Created by Ronan Rodrigo Nunes on 19/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import Foundation
import XCTest
import SwiftDate

class WeekWorkedHoursUsecaseTests: XCTestCase {
    var gateway: PunchGatewayFake!
    var presenter: WeekWorkedHoursPresenterFake!
    var usecase: WeekWorkedHoursUsecase!
    var calendar: NSCalendar!
    var dateComponents: NSDateComponents!
    let punchId = 1
    let secondsInOneHour = 3600.0
    let currentWeekHours = 0
    let pastWeekHours = 1
    
    override func setUp() {
        gateway = PunchGatewayFake()
        presenter = WeekWorkedHoursPresenterFake()
        usecase = WeekWorkedHoursUsecase(gateway: gateway, presenter: presenter)
        
        calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        dateComponents = NSDateComponents()
    }

    func testShouldCalculateTotalBetweenTwoPunchs() {
        gateway.create(punch(hour: 8, with: .Input))
        gateway.create(punch(hour: 12, with: .Output))
        
        usecase.total()
        
        let fourHours = "4h"
        XCTAssertEqual(fourHours, presenter.workHourGroups[currentWeekHours].workHours.first?.value)
    }
    
    func testShouldCalculateTotalBetweenFourPunchs() {
        gateway.create(punch(hour: 8, with: .Input))
        gateway.create(punch(hour: 18, with: .Output))
        gateway.create(punch(hour: 13, with: .Input))
        gateway.create(punch(hour: 12, with: .Output))

        usecase.total()
        
        let nineHours = "9h"
        XCTAssertEqual(nineHours, presenter.workHourGroups[currentWeekHours].workHours.first?.value)
    }
    
    func testShouldNotCalculateHoursWithoutOuputPunch() {
        gateway.create(punch(hour: 8, with: .Input))
        gateway.create(punch(hour: 12, with: .Output))
        gateway.create(punch(hour: 13, with: .Input))
        
        usecase.total()
        
        let fourHours = "4h"
        XCTAssertEqual(fourHours, presenter.workHourGroups[currentWeekHours].workHours.first?.value)
    }
    
    func testShouldNotCalculatePunchsWhenInputIsGreaterThanOutput() {
        gateway.create(punch(hour: 12, with: .Output))
        gateway.create(punch(hour: 13, with: .Input))
        
        usecase.total()
        
        XCTAssertEqual("0s", presenter.workHourGroups[currentWeekHours].workHours.first?.value)
    }
    
    func testShouldNotCalculatePunchsWhenExistsOnlyInputs() {
        gateway.create(punch(hour: 12, with: .Input))
        gateway.create(punch(hour: 18, with: .Input))
        
        usecase.total()
        
        XCTAssertEqual("0s", presenter.workHourGroups[currentWeekHours].workHours.first?.value)
    }
    
    func testShouldNotCalculatePunchsWhenExistsOnlyOutputs() {
        gateway.create(punch(hour: 12, with: .Output))
        gateway.create(punch(hour: 18, with: .Output))
        
        usecase.total()
        
        XCTAssertEqual("0s", presenter.workHourGroups[currentWeekHours].workHours.first?.value)
    }
    
    func testShouldNotCalculatePunchsOfOtherWeek() {
        let now = NSDate()
        gateway.create(punch(hour: 8, with: .Input))
        gateway.create(punch(hour: 12, with: .Output))
        gateway.create(punch(hour: 13, day: now.day-8, with: .Input))
        gateway.create(punch(hour: 18, day: now.day-8, with: .Output))
        
        usecase.total()
        
        let fourHours = "4h"
        XCTAssertEqual(fourHours, presenter.workHourGroups[currentWeekHours].workHours.first?.value)
    }
    
    private func punch(hour hour: Int, with type: PunchType) -> Punch {
        let now = NSDate()
        let moment = NSDate(year: now.year, month: now.month, day: now.day, hour: hour, minute: 0)
        return PunchStruct(id: punchId, type: type, moment: moment)
    }
    
    private func punch(hour hour: Int, day: Int, with type: PunchType) -> Punch {
        let now = NSDate()
        let moment = NSDate(year: now.year, month: now.month, day: day, hour: hour, minute: 0)
        return PunchStruct(id: punchId, type: type, moment: moment)
    }
    
}