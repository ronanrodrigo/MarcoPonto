//
//  SaveAppointmentUsecaseTests.swift
//  MarcoPonto
//
//  Created by Ronan Rodrigo Nunes on 16/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import XCTest

class SaveAppointmentUsecaseTests: XCTestCase {
    let now: NSDate = NSDate()
    var gateway: AppointmentGatewaySpy!
    var usecase: SaveAppointmentUsecase!
    
    override func setUp() {
        gateway = AppointmentGatewaySpy()
        usecase = SaveAppointmentUsecase(gateway: gateway)
    }
    
    func testShoudCreateAppointment() {
        let appointment = AppointmentStruct(moment: now)
        
        usecase.save(appointment)
        
        XCTAssertTrue(gateway.createSpied)
        XCTAssertFalse(gateway.updateSpied)
    }
    
    func testShoudUpdateAppointment() {
        let appointment = AppointmentStruct(id: 1, moment: now)
        
        usecase.save(appointment)
        
        XCTAssertTrue(gateway.updateSpied)
        XCTAssertFalse(gateway.createSpied)
    }
    
}
