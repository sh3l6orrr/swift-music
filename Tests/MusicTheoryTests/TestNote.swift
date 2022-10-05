//
//  TestNote.swift
//  MusicTheoryKit
//
//  Created by Jin Zhang on 12/13/21.
//

import XCTest
import MusicTheory

final class TestNote: XCTestCase {}

extension TestNote {
    func testNoteAddInterval() throws {
        XCTAssertEqual(Note.C + Interval.m2, Note.CD)
        XCTAssertEqual(Note.E + Interval.m2, Note.F)
        XCTAssertEqual(Note.AB + Interval.m7, Note.GA)
        XCTAssertEqual(Note.G + Interval.p5, Note.D)
    }
    func testNoteSubtractInterval() throws {
        XCTAssertEqual(Note.C - Interval.m2, Note.B)
        XCTAssertEqual(Note.E - Interval.m2, Note.DE)
        XCTAssertEqual(Note.AB - Interval.M6, Note.CD)
        XCTAssertEqual(Note.FG - Interval.p5, Note.B)
    }
    func testNoteSubtractNote() throws {
        XCTAssertEqual(Note.E - Note.C, Interval.M3)
        XCTAssertEqual(Note.GA - Note.CD, Interval.p5)
    }
    func testConsonance() throws {
        XCTAssertTrue(Note.E.isConsonant(with: .GA))
        XCTAssertTrue(Note.B.isConsonant(with: .GA))
        XCTAssertFalse(Note.CD.isConsonant(with: .G))
    }
    func testInChord() throws {
        XCTAssertTrue(Note.DE.isIn(chord: .init(.GA, .majorTriad)))
    }
    func testInScale() throws {
        XCTAssertTrue(Note.B.isIn(scale: .init(.B, .major)))
        XCTAssertTrue(Note.AB.isIn(scale: .init(.B, .major)))
        XCTAssertTrue(Note.AB.isIn(scale: .init(.GA, .minor)))
    }
}
