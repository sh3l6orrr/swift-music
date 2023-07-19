import XCTest
import MusicTheory

class TestScale: XCTestCase {
    func testNoteIn() throws {
        XCTAssertTrue(Note.A.isIn(scale: .init(.C, .major)))
        XCTAssertTrue(Note.GA.isIn(scale: .init(.B, .major)))
        XCTAssertTrue(Note.FG.isIn(scale: .init(.G, .major)))
        XCTAssertTrue(Note.F.isIn(scale: .init(.G, .minor)))
    }
    func testChordInt() throws {
        XCTAssertTrue(Chord(.FG, .dominantSeventh).isIn(scale: .init(.B, .major)))
    }
    func testAllTriads() throws {
        XCTAssertEqual(Scale(.B, .major).triad(degree: 6), Chord(.GA, .minorTriad))
    }
}

