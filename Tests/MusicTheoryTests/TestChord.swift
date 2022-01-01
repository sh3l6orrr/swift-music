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
        XCTAssertTrue(try Chord("Ab").contains(note: .C))
        XCTAssertTrue(try Chord("Ab/B").contains(note: .C))
    }
    func testChordQuality() throws {
        XCTAssertEqual(try Chord("Fsus2").description, "Fsus2")
        XCTAssertEqual(try Chord("F#7sus4").description, "F#7sus4")
        XCTAssertEqual(try Chord("E13").description, "E13")
        XCTAssertEqual(try Chord("Fsus2/A#").description, "Fsus2/A#")
        XCTAssertEqual(Chord(root: .G_sharp, quality: .minorTriad, over: .F_sharp).description, "G#m/F#")
    }
    func testNameInitFailure() throws {

        XCTAssertThrowsError(try Chord("5"))
        XCTAssertThrowsError(try Chord("C/F/D"))
        XCTAssertThrowsError(try Chord("Bb/F/"))
        XCTAssertThrowsError(try Chord("G/G"))
        XCTAssertThrowsError(try Chord("GAB"))
        XCTAssertThrowsError(try Chord("/"))
        XCTAssertThrowsError(try Chord("Csusm"))
    }
    func testInScale() throws {
        XCTAssertTrue(try Chord("Dbm").isIn(scale: .init(.B, .ionian)))
    }
}

// Need examination in terminal
extension TestChord {
    func testSummary() throws {
        print("*** Description of chord1. *** \n \(try Chord("A7").summary) \n *** End of description. ***\n")
        print("*** Description of chord2. *** \n \(try Chord("F#m/B").summary) \n *** End of description. ***\n")
    }
}

