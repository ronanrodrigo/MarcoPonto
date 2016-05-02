import XCTest
import SwiftDate

class CalculateWorkedHoursEntityTests: XCTestCase {
    var entity: CalculateWorkedHoursEntity!
    var inputPunchs: [Punch]!
    var outputPunchs: [Punch]!
    let today = NSDate()
    var yesterday: NSDate!

    override func setUp() {
        yesterday = today - 1.days
    }

    func testShouldCalculateTimeIntervalBetwenDateTimesInPunchLists() {
        inputPunchs = [PunchStruct(id: nil, type: .Input, moment: yesterday)]
        outputPunchs = [PunchStruct(id: nil, type: .Output, moment: today)]
        entity = CalculateWorkedHoursEntity(inputPunchs: inputPunchs, outputPunchs: outputPunchs)

        let totalTimeInterval = entity.calculate()

        XCTAssertEqual("24:00:00", totalTimeInterval.toTimeString())
    }

    func testShouldNotCalculatePunchWithoutOutput() {
        inputPunchs = [PunchStruct(id: nil, type: .Input, moment: yesterday),
                       PunchStruct(id: nil, type: .Input, moment: yesterday+1.hours)]
        outputPunchs = [PunchStruct(id: nil, type: .Output, moment: today)]
        entity = CalculateWorkedHoursEntity(inputPunchs: inputPunchs, outputPunchs: outputPunchs)

        let totalTimeInterval = entity.calculate()

        XCTAssertEqual("24:00:00", totalTimeInterval.toTimeString())
    }

    func testShouldNotCalculatePunchWithoutInput() {
        inputPunchs = [PunchStruct(id: nil, type: .Input, moment: yesterday)]
        outputPunchs = [PunchStruct(id: nil, type: .Output, moment: today),
                        PunchStruct(id: nil, type: .Output, moment: today+1.hours)]
        entity = CalculateWorkedHoursEntity(inputPunchs: inputPunchs, outputPunchs: outputPunchs)

        let totalTimeInterval = entity.calculate()

        XCTAssertEqual("24:00:00", totalTimeInterval.toTimeString())
    }

    func testShouldNotCalculateWhenOutputPunchIsLowerThanInputPunch() {
        inputPunchs = [PunchStruct(id: nil, type: .Input, moment: today)]
        outputPunchs = [PunchStruct(id: nil, type: .Output, moment: yesterday)]
        entity = CalculateWorkedHoursEntity(inputPunchs: inputPunchs, outputPunchs: outputPunchs)

        let totalTimeInterval = entity.calculate()

        XCTAssertEqual("00:00:00", totalTimeInterval.toTimeString())
    }

}
