//
//  TestScale.swift
//  MusicTheory
//
//  Created by Jin Zhang on 12/13/25.
//

import XCTest
import MusicTheory

final class TestScale: XCTestCase {}

extension TestScale {
    func testNoteIn() throws {
        XCTAssertTrue(Note.A.isIn(scale: .init(.C, .ionian)))
        XCTAssertTrue(Note.A_flat.isIn(scale: .init(.B, .ionian)))
        XCTAssertTrue(Note.F_sharp.isIn(scale: .init(.G, .ionian)))
        XCTAssertTrue(Note.F.isIn(scale: .init(.G, .minor)))
    }
    func testChordInt() throws {
        XCTAssertTrue(try Chord("Gb7").isIn(scale: .init(.B, .major)))
        XCTAssertTrue(try Chord("Fm7").isIn(scale: .init(.C_sharp, .major)))
    }
    func testAllTriads() throws {
        XCTAssertEqual(Scale(.B, .major).triad(at: 6), try Chord("G#m"))
        XCTAssertEqual(Scale(.B, .major).triad(at: 6), try Chord("Abm"))
        XCTAssertEqual(Scale(.B_flat, .minor).triad(at: 2), try Chord("Cdim"))
    }
}

extension TestScale {
    func testPrintSharpOrFlatAccordingToTonic() throws {
        print(Scale(.B, .major).allTriads)
        print(Scale(.G_flat, .major).allTriads)
    }
}
