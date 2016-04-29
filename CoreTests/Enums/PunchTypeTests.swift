//
// Created by Ronan Rodrigo Nunes on 29/04/16.
// Copyright (c) 2016 Ronan Rodrigo Nunes. All rights reserved.
//

import Foundation
import XCTest

class PunchTypeTests: XCTestCase {

    func testShouldBeAnOutputStringWhenIsOutputType() {
        XCTAssertEqual("Saída", PunchType.Output.description())
    }

    func testShouldBeAnInputStringWhenIsInputType() {
        XCTAssertEqual("Entrada", PunchType.Input.description())
    }
}
