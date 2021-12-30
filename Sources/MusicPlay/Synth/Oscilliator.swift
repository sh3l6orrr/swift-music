//
//  Oscillator.swift
//  music-play-kit
//
//  Created by Jin Zhang on 12/18/21.
//
//

import Foundation

/// An oscillator that produce sound with a specific waveform.
public struct Oscillator {
    /// Wave of this oscillator
    public let wave: Wave
}

extension Oscillator {
    /// Create an oscillator.
    public init(_ wave: Wave) {
        self.wave = wave
    }
}
