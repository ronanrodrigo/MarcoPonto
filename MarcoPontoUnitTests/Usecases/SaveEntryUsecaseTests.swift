//
//  SaveEntryUsecaseTests.swift
//  MarcoPonto
//
//  Created by Ronan Rodrigo Nunes on 16/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import XCTest

class SaveEntryUsecaseTests: XCTestCase {
    let now: NSDate = NSDate()
    var gateway: EntryGatewaySpy!
    var usecase: SaveEntryUsecase!
    
    override func setUp() {
        gateway = EntryGatewaySpy()
        usecase = SaveEntryUsecase(gateway: gateway)
    }
    
    func testShoudCreateEntry() {
        let entry = EntryStruct(moment: now)
        
        usecase.save(entry)
        
        XCTAssertTrue(gateway.createSpied)
        XCTAssertFalse(gateway.updateSpied)
    }
    
    func testShoudUpdateEntry() {
        let entry = EntryStruct(id: 1, moment: now)
        
        usecase.save(entry)
        
        XCTAssertTrue(gateway.updateSpied)
        XCTAssertFalse(gateway.createSpied)
    }
    
}
