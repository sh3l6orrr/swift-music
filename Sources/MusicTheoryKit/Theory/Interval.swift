//
//  Interval.swift
//  MusicTheoryKit
//
//  Created by Jin Zhang on 12/12/21.
//

/// A custom musical interval.
public enum Interval {
    /// A musical interval that contains 0 or 12 semitones.
    case octave
    /// A musical interval that contains 1 semitones.
    case m2
    /// A musical interval that contains 2 semitones.
    case M2
    /// A musical interval that contains 3 semitones.
    case m3
    /// A musical interval that contains 4 semitones.
    case M3
    /// A musical interval that contains 5 semitones.
    case p4
    /// A musical interval that contains 6 semitones.
    case tritone
    /// A musical interval that contains 7 semitones.
    case p5
    /// A musical interval that contains 8 semitones.
    case m6
    /// A musical interval that contains 9 semitones.
    case M6
    /// A musical interval that contains 10 semitones.
    case m7
    /// A musical interval that contains 11 semitones.
    case M7
}

extension Interval : Comparable {
    /// Create interval based on the number of semitones contained in it.
    public init?(semitone: Int) {
        guard semitone >= 0 else { return nil }
        guard let interval = intToInterval[semitone % 12] else { return nil }
        self = interval
    }
    /// Whole name of the interval.
    public var wholeName: String {
        intervalToWholeName[self]!
    }
}
