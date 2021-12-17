//
//  TestMelodyElement.swift
//  MusicTheoryKit
//
//  Created by Jin Zhang on 12/13/21.
//

import XCTest
import MusicTheoryKit

final class TestMelodyElement: XCTestCase {
    
    func testValue() throws {
        XCTAssertEqual(TestMelodyElement.musicNote1.value +
                       TestMelodyElement.pause1.value
                       , Value._2)
    }
    
    private static let musicNote1 = MusicNote(.C, octave: 4, value: ._4)!
    private static let pause1 = Pause(._4)
}
