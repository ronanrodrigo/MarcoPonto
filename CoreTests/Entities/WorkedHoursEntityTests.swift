import XCTest
import SwiftDate

class WorkedHoursEntityTests: XCTestCase {
    var entity: WorkedHoursEntity!
    var inputPunchs: [Punch]!
    var outputPunchs: [Punch]!
    let today = NSDate()
    var yesterday: NSDate!

    override func setUp() {
        yesterday = today - 1.days
    }

    func testShouldCalculateTimeIntervalBetwenDateTimesInPunchLists() {
        inputPunchs = [PunchStruct(identifier: nil, type: .Input, moment: yesterday)]
        outputPunchs = [PunchStruct(identifier: nil, type: .Output, moment: today)]
        entity = WorkedHoursEntity(inputPunchs: inputPunchs, outputPunchs: outputPunchs)

        let totalTimeInterval = entity.calculate()

        XCTAssertEqual("24:00:00", totalTimeInterval.toTimeString())
    }

    func testShouldNotCalculatePunchWithoutOutput() {
        inputPunchs = [PunchStruct(identifier: nil, type: .Input, moment: yesterday),
                       PunchStruct(identifier: nil, type: .Input, moment: yesterday+1.hours)]
        outputPunchs = [PunchStruct(identifier: nil, type: .Output, moment: today)]
        entity = WorkedHoursEntity(inputPunchs: inputPunchs, outputPunchs: outputPunchs)

        let totalTimeInterval = entity.calculate()

        XCTAssertEqual("24:00:00", totalTimeInterval.toTimeString())
    }

    func testShouldNotCalculatePunchWithoutInput() {
        inputPunchs = [PunchStruct(identifier: nil, type: .Input, moment: yesterday)]
        outputPunchs = [PunchStruct(identifier: nil, type: .Output, moment: today),
                        PunchStruct(identifier: nil, type: .Output, moment: today+1.hours)]
        entity = WorkedHoursEntity(inputPunchs: inputPunchs, outputPunchs: outputPunchs)

        let totalTimeInterval = entity.calculate()

        XCTAssertEqual("24:00:00", totalTimeInterval.toTimeString())
    }

    func testShouldNotCalculateWhenOutputPunchIsLowerThanInputPunch() {
        inputPunchs = [PunchStruct(identifier: nil, type: .Input, moment: today)]
        outputPunchs = [PunchStruct(identifier: nil, type: .Output, moment: yesterday)]
        entity = WorkedHoursEntity(inputPunchs: inputPunchs, outputPunchs: outputPunchs)

        let totalTimeInterval = entity.calculate()

        XCTAssertEqual("00:00:00", totalTimeInterval.toTimeString())
    }

}
