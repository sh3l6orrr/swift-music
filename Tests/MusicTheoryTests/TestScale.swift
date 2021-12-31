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
        XCTAssertTrue(Chord("Gb7")!.isIn(scale: .init(.B, .major)))
        XCTAssertTrue(Chord("Fm7")!.isIn(scale: .init(.C_sharp, .major)))
    }
}
