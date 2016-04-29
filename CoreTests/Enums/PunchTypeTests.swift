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
