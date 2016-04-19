//
//  SavePunchUsecaseTests.swift
//  MarcoPonto
//
//  Created by Ronan Rodrigo Nunes on 16/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import XCTest

class SavePunchUsecaseTests: XCTestCase {
    let now: NSDate = NSDate()
    var gateway: PunchGatewaySpy!
    var presenter: SavePunchPresenterSpy!
    var usecase: SavePunchUsecase!
    
    override func setUp() {
        gateway = PunchGatewaySpy()
        presenter = SavePunchPresenterSpy()
        usecase = SavePunchUsecase(gateway: gateway, presenter: presenter)
    }
    
    func testShoudCreatePunch() {
        let punch = PunchStruct(id: nil, type: .Input, moment: now)
        
        usecase.save(punch)
        
        XCTAssertTrue(gateway.createSpied)
        XCTAssertTrue(gateway.createSpied)
        XCTAssertTrue(presenter.didSavePunchSpied)
    }
    
    func testShoudUpdatePunch() {
        let punch = PunchStruct(id: 1, type: .Input, moment: now)
        
        usecase.save(punch)
        
        XCTAssertTrue(gateway.updateSpied)
        XCTAssertFalse(gateway.createSpied)
        XCTAssertTrue(presenter.didSavePunchSpied)
    }
    
}
