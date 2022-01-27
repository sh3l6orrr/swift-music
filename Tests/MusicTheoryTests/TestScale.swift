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
        XCTAssertTrue(Note.A.isIn(scale: .init(.C, .major)))
        XCTAssertTrue(Note.A_flat.isIn(scale: .init(.B, .major)))
        XCTAssertTrue(Note.F_sharp.isIn(scale: .init(.G, .major)))
        XCTAssertTrue(Note.F.isIn(scale: .init(.G, .minor)))
    }
    func testChordInt() throws {
        XCTAssertTrue(try Chord("Gb7").isIn(scale: .init(.B, .major)))
        XCTAssertTrue(try Chord("Fm7").isIn(scale: .init(.C_sharp, .major)))
    }
    func testAllTriads() throws {
        XCTAssertEqual(Scale(.B, .major).triad(degree: 6), try Chord("G#m"))
        XCTAssertEqual(Scale(.B, .major).triad(degree: 6), try Chord("Abm"))
        XCTAssertEqual(Scale(.B_flat, .minor).triad(degree: 2), try Chord("Cdim"))
        XCTAssertEqual(Scale(.A_flat, .minor).triad(degree: 2), try Chord("Bbdim"))
        XCTAssertEqual(Scale(.G, .major).triad(degree: 5), try Chord("D"))
    }
}

extension TestScale {
    func testPrintSharpOrFlatAccordingToTonic() throws {
        print(Scale(.B, .major).allTriads)
        print(Scale(.G_flat, .major).allTriads)
    }
}
 