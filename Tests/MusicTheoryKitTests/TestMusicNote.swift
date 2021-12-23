//
//  TestMusicNote.swift
//  
//
//  Created by Jin Zhang on 12/18/21.
//

import XCTest
@testable import MusicTheoryKit

final class TestMusicNote : XCTestCase {
    
    func testCreation() throws {
        XCTAssertEqual(musicNote1.octave, 4)
        XCTAssertEqual(musicNote2.note, Note.C)
    }
    
    func testFrequency() throws {
        XCTAssertEqual(musicNote3.frequency, 440)
        XCTAssertEqual(Int(musicNote1.frequency), Int(261.63))
    }
    
    let musicNote1 = MusicNote("C4", value: ._4)!
    let musicNote2 = MusicNote("C8", value: ._1)!
    let musicNote3 = MusicNote("A4", value: ._1)!
}
