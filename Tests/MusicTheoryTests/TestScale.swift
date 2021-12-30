//
//  TestScale.swift
//  MusicTheory
//
//  Created by Jin Zhang on 12/13/25.
//

import XCTest
import MusicTheory

final class TestScale : XCTestCase {}

extension TestScale {
    func testNoteIn() throws {
        XCTAssertTrue(Note.A.isIn(.init(.C, .ionian)))
        XCTAssertTrue(Note.A_flat.isIn(.init(.B, .ionian)))
        XCTAssertTrue(Note.F_sharp.isIn(.init(.G, .ionian)))
        XCTAssertTrue(Note.F.isIn(.init(.G, .minor)))
    }
    func testChordInt() throws {
        XCTAssertTrue(Chord("Gb7")!.isIn(.init(.B, .major)))
        XCTAssertTrue(Chord("Fm7")!.isIn(.init(.C_sharp, .major)))
    }
}
