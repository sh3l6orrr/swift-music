//
//  TestScale.swift
//  MusicTheoryKit
//
//  Created by Jin Zhang on 12/13/25.
//

import XCTest
import MusicTheoryKit

final class TestScale : XCTestCase {}

extension TestScale {
    func testNoteIn() throws {
        XCTAssertTrue(Note.A.isIn(.init(.C, .ionian)))
        XCTAssertTrue(Note.Ab.isIn(.init(.B, .ionian)))
        XCTAssertTrue(Note.Gb.isIn(.init(.G, .ionian)))
        XCTAssertTrue(Note.F.isIn(.init(.G, .minor)))
    }
    func testChordInt() throws {
        XCTAssertTrue(Chord("Gb7")!.isIn(.init(.B, .major)))
        XCTAssertTrue(Chord("Fm7")!.isIn(.init(.Cs, .major)))
    }
}
