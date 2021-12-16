//
//  TestChord.swift
//  MusicTheoryKit
//
//  Created by Jin Zhang on 12/13/21.
//

import XCTest
import Rainbow
import MusicTheoryKit

final class TestChord: XCTestCase {
    
    func testChordQuality() throws {
        XCTAssertEqual(TestChord.chord1.name, "Fsus2")
        XCTAssertEqual(TestChord.chord2.name, "Gb7sus4")
        XCTAssertEqual(TestChord.chord3.name, "Bm7b5")
        XCTAssertEqual(TestChord.chord4.name, "Bm7b5")
    }
    
    func testCreationFail() throws {
        XCTAssertNil(TestChord.nilChord1)
        XCTAssertNil(TestChord.nilChord2)
        XCTAssertNil(TestChord.nilChord3)
    }
    
    func testSlashChord() throws {
        XCTAssertEqual(TestChord.slashChord1.name, "Fsus2/Bb")
        XCTAssertEqual(TestChord.slashChord2.name, "Fsus2")
    }
    
    func testDescrition() throws {
        print("*** Description of chord1. *** \n \(TestChord.chord1.description.green) \n *** End of description. ***\n")
        print("*** Description of chord2. *** \n \(TestChord.chord2.description.green) \n *** End of description. ***\n")
        print("*** Description of slahChord1. *** \n \(TestChord.slashChord1.description.green) \n *** End of description. ***\n")
    }
    
    private static let chord1: Chord = Chord(notes: Set([.F, .G, .C]), root: .F)!
    private static let chord2: Chord = Chord(notes: Set([.E, .Db, .Gb, .B]), root: .Gb)!
    private static let chord3: Chord = Chord(notes: Set([.A, .F, .D, .B]), root: .B)!
    private static let chord4: Chord = Chord(notes: Set([.A, .F, .D, .F, .B]), root: .B)!
    private static let slashChord1: Chord = Chord(notes: Set([.F, .G, .C]), root: .F, slash: .Bb)!
    private static let slashChord2: Chord = Chord(notes: Set([.F, .G, .C]), root: .F, slash: .F)!
    private static let nilChord1: Chord? = Chord(notes: Set([.E, .Ab, .F]), root: .E)
    private static let nilChord2: Chord? = Chord(notes: Set([.E, .Ab, .F]), root: .E, slash: .B)
    private static let nilChord3: Chord? = Chord(notes: Set([.E, .E, .F]), root: .C, slash: .B)
}
