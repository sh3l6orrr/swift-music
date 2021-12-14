//
//  TestNote.swift
//  MusicTheoryKit
//
//  Created by Jin Zhang on 12/13/21.
//

import XCTest
import MusicTheoryKit

final class TestNote: XCTestCase {
    
    func testNoteAddInterval() throws {
        XCTAssertEqual(Note.C + Interval.m2, Note.Db)
        XCTAssertEqual(Note.E + Interval.m2, Note.F)
        XCTAssertEqual(Note.Bb + Interval.m7, Note.Ab)
        XCTAssertEqual(Note.G + Interval.p5, Note.D)
    }
    
    func testNoteSubtractInterval() throws {
        XCTAssertEqual(Note.C - Interval.m2, Note.B)
        XCTAssertEqual(Note.E - Interval.m2, Note.Eb)
        XCTAssertEqual(Note.Bb - Interval.M6, Note.Db)
        XCTAssertEqual(Note.Gb - Interval.p5, Note.B)
    }
    
    func testNoteSubtractNote() throws {
        XCTAssertEqual(Note.E - Note.C, Interval.M3)
        XCTAssertEqual(Note.Ab - Note.Db, Interval.p5)
    }
}
