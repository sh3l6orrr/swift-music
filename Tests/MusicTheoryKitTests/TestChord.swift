//
//  TestChord.swift
//  MusicTheoryKit
//
//  Created by Jin Zhang on 12/13/21.
//

import XCTest
import MusicTheoryKit

final class TestChord : XCTestCase {}

extension TestChord {
    var chord1: Chord {
        Chord(.F, Set([.F, .G, .C]))
    }
    var chord2: Chord {
        Chord(.Gb, Set([.E, .Db, .Gb, .B]))
    }
    var chord3: Chord {
        Chord(.B, Set([.A, .F, .D, .B]))
    }
    var chord4: Chord {
        Chord(.B, Set([.A, .F, .D, .F, .B]))
    }
    var chord5: Chord {
        Chord(.C, Set([.C, .D, .E, .F, .G, .Bb]))
    }
    var chord6: Chord {
        Chord(.C, Set([.C, .D, .E, .F, .G, .Bb, .A]))
    }
    var slashChord1: Chord {
        Chord(.F, Set([.F, .G, .C]), over: .Bb)
    }
    var slashChord2: Chord {
        Chord(.F, Set([.F, .G, .C]), over: .F)
    }
    func testChordQuality() throws {
        XCTAssertEqual(chord1.name, "Fsus2")
        XCTAssertEqual(chord2.name, "Gb7sus4")
        XCTAssertEqual(chord3.name, "Bm7b5")
        XCTAssertEqual(chord4.name, "Bm7b5")
        XCTAssertEqual(chord5.name, "C11")
        XCTAssertEqual(chord6.name, "C13")
    }
    func testSlashChord() throws {
        XCTAssertEqual(slashChord1.name, "Fsus2/Bb")
        XCTAssertEqual(slashChord2.name, "Fsus2")
    }
    func testNameInit() throws {
        XCTAssertEqual(Chord("C13")?.description, chord6.description)
        XCTAssertEqual(Chord("Bm7b5")?.description, chord4.description)
        XCTAssertEqual(Chord("Fsus2/Bb")?.description, slashChord1.description)
        XCTAssertEqual(Chord("Fsus2")?.description, slashChord2.description)
    }
    func testNameInitFailure() throws {
        XCTAssertNil(Chord("/"))
        XCTAssertNil(Chord("5"))
        XCTAssertNil(Chord("C/F/D"))
        XCTAssertNil(Chord("/Csus2/F/"))
    }
    func testDescrition() throws {
        print("*** Description of chord1. *** \n \(chord1.description) \n *** End of description. ***\n")
        print("*** Description of chord2. *** \n \(chord2.description) \n *** End of description. ***\n")
        print("*** Description of slashChord1. *** \n \(slashChord1.description) \n *** End of description. ***\n")
        print("*** Description of nameChord1. *** \n \(Chord("Cmaj9/G")!.description) \n *** End of description. ***\n")
    }
}

