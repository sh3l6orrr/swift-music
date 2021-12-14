import XCTest
@testable import MusicTheoryKit

final class MusicTheoryKitTests: XCTestCase {
    
    func testNoteAddition() throws {
        XCTAssertEqual(Note.C + Interval.m2, Note.Db)
        XCTAssertEqual(Note.E + Interval.m2, Note.F)
        XCTAssertEqual(Note.Bb + Interval.m7, Note.Ab)
        XCTAssertEqual(Note.G + Interval.p5, Note.D)
    }
    
    func testNoteSubtraction() throws {
        XCTAssertEqual(Note.C - Interval.m2, Note.B)
        XCTAssertEqual(Note.E - Interval.m2, Note.Eb)
        XCTAssertEqual(Note.Bb - Interval.M6, Note.Db)
        XCTAssertEqual(Note.Gb - Interval.p5, Note.B)
    }
}
