//
//  WeekHoursUsecaseTests.swift
//  MarcoPonto
//
//  Created by Ronan Rodrigo Nunes on 19/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import Foundation
import XCTest

class CurrentWeekHoursPresenterFake: CurrentWeekHoursPresenter {
    var total = NSTimeInterval()

    func showTotal(total: NSTimeInterval) {
        self.total = total
    }
}

class PunchGatewayFake: PunchGateway {
    var punchs: [Punch] = []
    
    func create(punch: Punch) {
        punchs.append(punch)
    }
    
    func update(punch: Punch) {
        
    }
    
    func delete(punch: Punch) {
        
    }
    
    func list() -> [Punch] {
        return punchs
    }
}

class CurrentWeekHoursUsecaseTests: XCTestCase {
    var gateway: PunchGatewayFake!
    var presenter: CurrentWeekHoursPresenterFake!
    var usecase: CurrentWeekHoursUsecase!
    var calendar: NSCalendar!
    var dateComponents: NSDateComponents!
    let punchId = 1
    let seconsInOneHour = 3600.0
    
    override func setUp() {
        gateway = PunchGatewayFake()
        presenter = CurrentWeekHoursPresenterFake()
        usecase = CurrentWeekHoursUsecase(gateway: gateway, presenter: presenter)
        
        calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        dateComponents = NSDateComponents()
    }

    func testCalculateTotalBetweenTwoPunchs() {
        let punchAt8 = createPunchStruct(at: 8, as: .Input)
        gateway.create(punchAt8)
        let punchAt10 = createPunchStruct(at: 10, as: .Output)
        gateway.create(punchAt10)
        
        usecase.total()
        
        XCTAssertEqual(2*seconsInOneHour, presenter.total)
    }
    
    private func createPunchStruct(at hour: Int, as type: PunchType) -> Punch {
        dateComponents.hour = hour
        return PunchStruct(id: punchId, type: type, moment: calendar.dateFromComponents(dateComponents)!)
    }
    
}