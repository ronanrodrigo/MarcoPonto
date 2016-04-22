//
//  ListPunchsUsecaseTests.swift
//  MarcoPonto
//
//  Created by Ronan Rodrigo Nunes on 17/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import XCTest

class ListPunchsUsecaseTests: XCTestCase {
    var gateway: PunchGatewaySpy!
    var presenter: ListPunchsPresenterSpy!
    var usecase: ListPunchsUsecase!
    
    override func setUp() {
        gateway = PunchGatewaySpy()
        presenter = ListPunchsPresenterSpy()
        usecase = ListPunchsUsecase(gateway: gateway, presenter: presenter)
    }
    
    func testShouldListPunchs() {
        self.usecase.list()
        
        XCTAssertTrue(self.gateway.listSpied)
        XCTAssertTrue(self.presenter.listSpied)
    }
}
