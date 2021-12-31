//
//  TestChord.swift
//  MusicTheoryKit
//
//  Created by Jin Zhang on 12/13/21.
//

import XCTest
import MusicTheory

final class TestChord: XCTestCase {}

extension TestChord {
    func testContainNote() throws {
        XCTAssertTrue(Chord("Ab")!.contains(note: .C))
        XCTAssertTrue(Chord("Ab/B")!.contains(note: .C))
    }
    func testChordQuality() throws {
        XCTAssertEqual(Chord("Fsus2")!.description, "Fsus2")
        XCTAssertEqual(Chord("F#7sus4")!.description, "F#7sus4")
        XCTAssertEqual(Chord("E13")!.description, "E13")
        XCTAssertEqual(Chord("Fsus2/A#")!.description, "Fsus2/A#")
    }
    func testNameInitFailure() throws {
        XCTAssertNil(Chord("/"))
        XCTAssertNil(Chord("5"))
        XCTAssertNil(Chord("C/F/D"))
        XCTAssertNil(Chord("/Bbsus2/F/"))
        XCTAssertNil(Chord("G/G"))
        XCTAssertNil(Chord("GAB"))
    }
    func testInScale() throws {
        XCTAssertTrue(Chord("Dbm")!.isIn(scale: .init(.B, .ionian)))
    }
}

// Need examination in terminal
extension TestChord {
    func testSummary() throws {
        print("*** Description of chord1. *** \n \(Chord("A7")!.summary) \n *** End of description. ***\n")
        print("*** Description of chord2. *** \n \(Chord("F#m/B")!.summary) \n *** End of description. ***\n")
    }
}

