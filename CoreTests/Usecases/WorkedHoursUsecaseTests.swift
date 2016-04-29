//
//  WorkedHoursUsecaseTests.swift
//  MarcoPonto
//
//  Created by Ronan Rodrigo Nunes on 29/04/16.
//  Copyright © 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import Foundation
import XCTest

class WorkedHoursUsecaseTests: XCTestCase {
    var usecase: WorkedHoursUsecase!
    var presenter: WorkedHoursPresenterFake!
    var gateway: PunchGatewaySpy!
    
    override func setUp() {
        gateway = PunchGatewaySpy()
        presenter = WorkedHoursPresenterFake()
        usecase = WorkedHoursUsecase(gateway: gateway, presenter: presenter)
    }

    func testShouldHaveThreeWokedHoursReport() {
        usecase.total()

        XCTAssertEqual(5, presenter.workHours.count)
        XCTAssertEqual(10, gateway.listSpieds.count)
    }
}