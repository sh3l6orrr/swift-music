//
//  Interval.swift
//  MusicTheoryKit
//
//  Created by Jin Zhang on 12/12/21.
//

/// A custom musical interval.
public enum Interval : Comparable {
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
    /// Create interval based on the number of semitones contained in it.
    public init?(semitone: Int) {
        guard semitone >= 0 else { return nil }
        guard let interval = intToInterval[semitone % 12] else { return nil }
        self = interval
    }
}

extension Interval : CustomStringConvertible {
    /// String representation of the interval.
    public var description: String {
        switch self {
        case .octave: return "octave"
        case .m2: return "minor second"
        case .M2: return "major second"
        case .m3: return "minor third"
        case .M3: return "major third"
        case .p4: return "perfect fourth"
        case .tritone: return "tritone"
        case .p5: return "perfect fifth"
        case .m6: return "minor sixth"
        case .M6: return "major sixth"
        case .m7: return "minor seventh"
        case .M7: return "major seventh"
        }
    }
}
