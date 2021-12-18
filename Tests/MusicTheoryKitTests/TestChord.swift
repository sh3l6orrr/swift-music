//
//  TestChord.swift
//  MusicTheoryKit
//
//  Created by Jin Zhang on 12/13/21.
//

import XCTest
import Rainbow
import MusicTheoryKit

final class TestChord : XCTestCase {
    
    func testChordQuality() throws {
        XCTAssertEqual(TestChord.chord1.name, "Fsus2")
        XCTAssertEqual(TestChord.chord2.name, "Gb7sus4")
        XCTAssertEqual(TestChord.chord3.name, "Bm7b5")
        XCTAssertEqual(TestChord.chord4.name, "Bm7b5")
        XCTAssertEqual(TestChord.chord5.name, "C11")
        XCTAssertEqual(TestChord.chord6.name, "C13")
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
    
    func testNameInit() throws {
        XCTAssertEqual(Chord("C13")?.description, TestChord.chord6.description)
        XCTAssertEqual(Chord("Bm7b5")?.description, TestChord.chord4.description)
        XCTAssertEqual(Chord("Fsus2/Bb")?.description, TestChord.slashChord1.description)
        XCTAssertEqual(Chord("Fsus2")?.description, TestChord.slashChord2.description)
    }
    
    func testNameInitFailure() throws {
        XCTAssertNil(Chord("/"))
        XCTAssertNil(Chord("5"))
        XCTAssertNil(Chord("C/F/D"))
        XCTAssertNil(Chord("/Csus2/F/"))
    }
    
    func testDescrition() throws {
        print("*** Description of chord1. *** \n \(TestChord.chord1.description.green) \n *** End of description. ***\n")
        print("*** Description of chord2. *** \n \(TestChord.chord2.description.green) \n *** End of description. ***\n")
        print("*** Description of slashChord1. *** \n \(TestChord.slashChord1.description.green) \n *** End of description. ***\n")
        print("*** Description of nameChord1. *** \n \(Chord("Cmaj9/G")!.description.green) \n *** End of description. ***\n")
    }
    
    private static let chord1: Chord = Chord(root: .F, notes: Set([.F, .G, .C]))!
    private static let chord2: Chord = Chord(root: .Gb, notes: Set([.E, .Db, .Gb, .B]))!
    private static let chord3: Chord = Chord(root: .B, notes: Set([.A, .F, .D, .B]))!
    private static let chord4: Chord = Chord(root: .B, notes: Set([.A, .F, .D, .F, .B]))!
    private static let chord5: Chord = Chord(root: .C, notes: Set([.C, .D, .E, .F, .G, .Bb]))!
    private static let chord6: Chord = Chord(root: .C, notes: Set([.C, .D, .E, .F, .G, .Bb, .A]))!
    
    private static let slashChord1: Chord = Chord(root: .F, notes: Set([.F, .G, .C]), slash: .Bb)!
    private static let slashChord2: Chord = Chord(root: .F, notes: Set([.F, .G, .C]), slash: .F)!
    
    private static let nilChord1: Chord? = Chord(root: .E, notes: Set([.E, .Ab, .F]))
    private static let nilChord2: Chord? = Chord(root: .E, notes: Set([.E, .Ab, .F]), slash: .B)
    private static let nilChord3: Chord? = Chord(root: .C, notes: Set([.E, .E, .F]), slash: .B)
}
