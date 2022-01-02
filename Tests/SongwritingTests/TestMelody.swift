//
//  TestMelody.swift
//  MusicTheory
//
//  Created by Jin Zhang on 12/13/21.
//

import XCTest
import Songwriting
import MusicTheory

final class TestMelody : XCTestCase {}

extension TestMelody {
    func testNotePitch() throws {
        XCTAssertEqual(MelodyNote(of: .C, octave: 4, lasting: .quarter).pitch.rounded(), 262)
    }

}
