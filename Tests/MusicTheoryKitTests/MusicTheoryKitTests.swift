import XCTest
@testable import MusicTheoryKit

final class MusicTheoryKitTests: XCTestCase {
    func testNoteAddition() throws {

        XCTAssertEqual(Note.C + Interval.m2, Note.Db)
        XCTAssertEqual(Note.E + Interval.m2, Note.F)
        XCTAssertEqual(Note.Bb + Interval.m7, Note.Ab)
        XCTAssertEqual(Note.G + Interval.p5, Note.D)
        
    }
}
