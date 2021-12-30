//
//  TestMelody.swift
//  MusicTheory
//
//  Created by Jin Zhang on 12/13/21.
//

import XCTest
import MusicTheory

final class TestMelody : XCTestCase {}

extension TestMelody {
    var melody: Melody {
        Melody()
            .add(MusicNote("C4", value: ._4)!)
            .add(Pause(._4))
            .add(Pause(._2))
            .add(MusicNote("C8", value: ._1)!)
    }
    func testLength() throws {
        XCTAssertEqual(melody.beats, 2)
    }
    func testIteration() throws {
        print("*** Elements in this melody ***")
        _ = melody.map {
            print($0)
        }
        print("*** Elements in this melody ***")
    }
}
