import XCTest
import MusicTheory

class TestInterval: XCTestCase {
    func testIntervalWholeName() throws {
        XCTAssertEqual(Interval.octave.description, "octave")
        XCTAssertEqual(Interval.m6.description, "minor sixth")
    }
    func testCreation() throws {
        XCTAssertNotNil(Interval(semitone: 9031))
    }
}

