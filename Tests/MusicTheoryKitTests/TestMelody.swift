//
//  TestMelody.swift
//  MusicTheoryKit
//
//  Created by Jin Zhang on 12/13/21.
//

import XCTest
import MusicTheoryKit

final class TestMelody : XCTestCase {
    
    func testLength() throws {
        XCTAssertEqual(melody1.beats, 2)
    }
    
    func testIteration() throws {
        print("*** Elements in this melody ***".lightBlue)
        for musicElement in melody1 {
            print(musicElement)
        }
        print("*** Elements in this melody ***".lightBlue)
    }
    
    let musicNote1 = MusicNote("C4", value: ._4)!
    let musicNote2 = MusicNote("C8", value: ._1)!
    let musicNote3 = MusicNote("A4", value: ._1)!
    let pause1 = Pause(._4)
    let pause2 = Pause(._2)
    var melody1: Melody {
        Melody()
            .add(musicNote1)
            .add(pause1)
            .add(pause2)
            .add(musicNote2)
    }
}
