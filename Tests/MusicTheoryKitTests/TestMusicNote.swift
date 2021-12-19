//
//  TestMusicNote.swift
//  
//
//  Created by Jin Zhang on 12/18/21.
//

import XCTest
import MusicTheoryKit

final class TestMusicNote : XCTestCase {
    
    func testCreation() throws {
        XCTAssertEqual(TestMusicNote.musicNote1.octave, 4)
        XCTAssertEqual(TestMusicNote.musicNote2.note, Note.C)
    }
    
    func testFrequency() throws {
        XCTAssertEqual(TestMusicNote.musicNote3.frequency, 440)
        XCTAssertEqual(Int(TestMusicNote.musicNote1.frequency), Int(261.63))
    }
    
    private static let musicNote1 = MusicNote("C4", value: ._4)!
    private static let musicNote2 = MusicNote("C8", value: ._1)!
    private static let musicNote3 = MusicNote("A4", value: ._1)!
}
