//
//  TestChord.swift
//  MusicTheoryKit
//
//  Created by Jin Zhang on 12/13/21.
//

import XCTest
import MusicTheoryKit

final class TestChord: XCTestCase {
    
    func testChordQuality() throws {
        let notes1 = Set([Note.E, Note.Ab, Note.B])
        let chord1 = Chord(notes: notes1, root: Note.E)
        XCTAssertEqual(chord1!.name, "E")
        
        let notes2 = Set([Note.E, Note.Gb, Note.B])
        let chord2 = Chord(notes: notes2, root: Note.E)
        XCTAssertEqual(chord2!.name, "Esus2")
        
        let notes3 = Set([Note.Db, Note.Gb, Note.B])
        let chord3 = Chord(notes: notes3, root: Note.Gb)
        XCTAssertEqual(chord3!.name, "Gbsus4")
        
        let notes4 = Set([Note.E, Note.Db, Note.Gb, Note.B])
        let chord4 = Chord(notes: notes4, root: Note.Gb)
        XCTAssertEqual(chord4!.name, "Gb7sus4")
    }
}
