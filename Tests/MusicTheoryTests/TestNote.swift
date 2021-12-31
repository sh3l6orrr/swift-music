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
    func testNoteEquality() throws {
        XCTAssertEqual(Note.E_flat, Note.D_sharp)
    }
    func testNoteAddInterval() throws {
        XCTAssertEqual(Note.C + Interval.m2, Note.D_flat)
        XCTAssertEqual(Note.E + Interval.m2, Note.F)
        XCTAssertEqual(Note.B_flat + Interval.m7, Note.A_flat)
        XCTAssertEqual(Note.G + Interval.p5, Note.D)
    }
    func testNoteSubtractInterval() throws {
        XCTAssertEqual(Note.C - Interval.m2, Note.B)
        XCTAssertEqual(Note.E - Interval.m2, Note.E_flat)
        XCTAssertEqual(Note.A_sharp - Interval.M6, Note.C_sharp)
        XCTAssertEqual(Note.G_flat - Interval.p5, Note.B)
    }
    func testNoteSubtractNote() throws {
        XCTAssertEqual(Note.E - Note.C, Interval.M3)
        XCTAssertEqual(Note.G_sharp - Note.C_sharp, Interval.p5)
    }
    func testConsonance() throws {
        XCTAssertTrue(Note.E.isConsonant(with: .A_flat))
        XCTAssertTrue(Note.B.isConsonant(with: .G_sharp))
        XCTAssertFalse(Note.C_sharp.isConsonant(with: .G))
    }
    func testInChord() throws {
        XCTAssertTrue(Note.E.isIn(chord: .init("E/B")!))
        XCTAssertTrue(Note.D_sharp.isIn(chord: .init("Ab")!))
        // Don't understand why fail sometimes?
        XCTAssertTrue(Note.E_flat.isIn(chord: .init("Ab")!))
        XCTAssertTrue(Note.F.isIn(chord: .init("Db11")!))
        XCTAssertTrue(Note.A.isIn(chord: .init("F#m")!))
    }
    func testInScale() throws {
        XCTAssertTrue(Note.B.isIn(scale: .init(.B, .major)))
        XCTAssertTrue(Note.B_flat.isIn(scale: .init(.B, .major)))
        XCTAssertTrue(Note.B_flat.isIn(scale: .init(.G_sharp, .aeolian)))
    }
}
