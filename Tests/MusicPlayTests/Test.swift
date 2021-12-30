//
//  Test.swift
//  
//
//  Created by Jin Zhang.
//

import XCTest
import MusicPlay
import MusicTheory

final class TestXXX: XCTestCase {
    func testXX() throws {
        
        let wave = Wave.square
        let oscillator = Oscillator(wave)
        let synth = Synth(oscillator: oscillator)
        synth.play(MusicNote("E7")!)
    }
}
