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
    var presenter: SaveEntryPresenterSpy!
    var usecase: SaveEntryUsecase!
    
    override func setUp() {
        gateway = EntryGatewaySpy()
        presenter = SaveEntryPresenterSpy()
        usecase = SaveEntryUsecase(gateway: gateway, presenter: presenter)
    }
    
    func testShoudCreateEntry() {
        let entry = EntryStruct(id: nil, type: .Input, moment: now)
        
        usecase.save(entry)
        
        XCTAssertTrue(gateway.createSpied)
        XCTAssertTrue(gateway.createSpied)
        XCTAssertTrue(presenter.didSaveEntrySpied)
    }
    
    func testShoudUpdateEntry() {
        let entry = EntryStruct(id: 1, type: .Input, moment: now)
        
        usecase.save(entry)
        
        XCTAssertTrue(gateway.updateSpied)
        XCTAssertFalse(gateway.createSpied)
        XCTAssertTrue(presenter.didSaveEntrySpied)
    }
    
}
