//
//  TestMelody.swift
//  MusicTheoryKit
//
//  Created by Jin Zhang on 12/13/21.
//

import XCTest
import MusicTheoryKit

final class TestMelody: XCTestCase {
    
    func testLength() throws {
        XCTAssertEqual(TestMelody.musicNote1.value + TestMelody.pause1.value, Value._2)
        XCTAssertEqual(TestMelody.melody1.length, 2)
    }
    
    private static let musicNote1 = MusicNote(.C, octave: 4, value: ._4)!
    private static let musicNote2 = MusicNote(.C, octave: 8, value: ._1)!
    private static let pause1 = Pause(._4)
    private static let pause2 = Pause(._2)
    private static var melody1: Melody {
        let melody = Melody()
        melody.add(musicNote1)
        melody.add(pause1)
        melody.add(pause2)
        melody.add(musicNote2)
        return melody
    }
}
