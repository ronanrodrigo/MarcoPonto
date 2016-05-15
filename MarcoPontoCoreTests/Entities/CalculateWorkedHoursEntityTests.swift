import XCTest
import SwiftDate

class CalculateWorkedHoursEntityTests: XCTestCase {
    var entity: TotalWorkedHoursEntity!
    var inputPunchs: [Punch]!
    var outputPunchs: [Punch]!
    var lastDate: NSDate!
    var firstDate: NSDate!

    override func setUp() {
        firstDate = NSDate(yearForWeekOfYear: 2016, weekOfYear: 1, weekday: 2)
        lastDate = firstDate + 1.days
    }

    func testShouldCalculateTimeIntervalBetwenDateTimesInPunchLists() {
        inputPunchs = [PunchStruct(id: nil, type: .Input, moment: firstDate)]
        outputPunchs = [PunchStruct(id: nil, type: .Output, moment: lastDate)]
        entity = TotalWorkedHoursEntity(inputPunchs: inputPunchs, outputPunchs: outputPunchs)

        let totalTimeInterval = entity.calculate()

        XCTAssertEqual("24h 00m", totalTimeInterval.toTimeString())
    }

    func testShouldNotCalculatePunchWithoutOutput() {
        inputPunchs = [PunchStruct(id: nil, type: .Input, moment: firstDate),
                       PunchStruct(id: nil, type: .Input, moment: firstDate+1.hours)]
        outputPunchs = [PunchStruct(id: nil, type: .Output, moment: lastDate)]
        entity = TotalWorkedHoursEntity(inputPunchs: inputPunchs, outputPunchs: outputPunchs)

        let totalTimeInterval = entity.calculate()

        XCTAssertEqual("24h 00m", totalTimeInterval.toTimeString())
    }

    func testShouldNotCalculatePunchWithoutInput() {
        inputPunchs = [PunchStruct(id: nil, type: .Input, moment: firstDate)]
        outputPunchs = [PunchStruct(id: nil, type: .Output, moment: lastDate),
                        PunchStruct(id: nil, type: .Output, moment: lastDate+1.hours)]
        entity = TotalWorkedHoursEntity(inputPunchs: inputPunchs, outputPunchs: outputPunchs)

        let totalTimeInterval = entity.calculate()

        XCTAssertEqual("24h 00m", totalTimeInterval.toTimeString())
    }

    func testShouldNotCalculateWhenOutputPunchIsLowerThanInputPunch() {
        inputPunchs = [PunchStruct(id: nil, type: .Input, moment: lastDate)]
        outputPunchs = [PunchStruct(id: nil, type: .Output, moment: firstDate)]
        entity = TotalWorkedHoursEntity(inputPunchs: inputPunchs, outputPunchs: outputPunchs)

        let totalTimeInterval = entity.calculate()

        XCTAssertEqual("00h 00m", totalTimeInterval.toTimeString())
    }


    func testShouldPlusThirtyMinutesForOneHourWhenWasSunday() {
        var sunday = NSDate(year: 2016, month: 5, day: 8, hour: 10, minute: 0, second: 0)
        inputPunchs = [PunchStruct(id: nil, type: .Input, moment: sunday)]
        sunday = sunday + 1.hours
        outputPunchs = [PunchStruct(id: nil, type: .Output, moment: sunday)]
        entity = TotalWorkedHoursEntity(inputPunchs: inputPunchs, outputPunchs: outputPunchs)

        let totalTimeInterval = entity.calculate()

        XCTAssertEqual("01h 30m", totalTimeInterval.toTimeString())
    }

    func testShouldPlusSixtyMinutesForTwoHourWhenWasSunday() {
        var sunday = NSDate(year: 2016, month: 5, day: 8, hour: 10, minute: 0, second: 0)
        inputPunchs = [PunchStruct(id: nil, type: .Input, moment: sunday)]
        sunday = sunday + 2.hours
        outputPunchs = [PunchStruct(id: nil, type: .Output, moment: sunday)]
        entity = TotalWorkedHoursEntity(inputPunchs: inputPunchs, outputPunchs: outputPunchs)

        let totalTimeInterval = entity.calculate()

        XCTAssertEqual("03h 00m", totalTimeInterval.toTimeString())
    }
}
