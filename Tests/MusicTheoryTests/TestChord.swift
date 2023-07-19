import XCTest
import MusicTheory

class TestChord: XCTestCase {
    func testContainNote() throws {
        XCTAssertTrue(Chord(.B, .minorTriadAdded11th).contains(note: .B))
        XCTAssertTrue(Chord(.B, .minorTriadAdded11th).contains(note: .E))
        XCTAssertTrue(Chord(.B, .minorTriadAdded11th).contains(note: .D))
    }

    func testChordQuality() throws {
        XCTAssertEqual(Chord(.A, notes: [.A, .C, .D, .A, .E]).quality, .minorTriadAdded11th)
    }
    func testInScale() throws {
        XCTAssertTrue(Chord(.DE, .minorTriad).isIn(scale: .init(.B, .major)))
    }
}


