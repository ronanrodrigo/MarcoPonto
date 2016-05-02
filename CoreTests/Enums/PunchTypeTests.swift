import Foundation
import XCTest

class PunchTypeTests: XCTestCase {

    func testShouldBeAnOutputStringWhenIsOutputType() {
        XCTAssertEqual("Saída", PunchType.Output.title)
    }

    func testShouldBeAnInputStringWhenIsInputType() {
        XCTAssertEqual("Entrada", PunchType.Input.title)
    }
}
