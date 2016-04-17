//
//  ListEntriesUsecaseTests.swift
//  MarcoPonto
//
//  Created by Ronan Rodrigo Nunes on 17/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import XCTest

class ListEntriesUsecaseTests: XCTestCase {
    var gateway: EntryGatewaySpy!
    var presenter: ListEntriesPresenterSpy!
    var usecase: ListEntriesUsecase!
    
    override func setUp() {
        gateway = EntryGatewaySpy()
        presenter = ListEntriesPresenterSpy()
        usecase = ListEntriesUsecase(gateway: gateway, presenter: presenter)
    }
    
    func testShouldListEntries() {
        self.usecase.list()
        
        XCTAssertTrue(self.gateway.listSpied)
        XCTAssertTrue(self.presenter.listSpied)
    }
}
