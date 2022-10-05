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

