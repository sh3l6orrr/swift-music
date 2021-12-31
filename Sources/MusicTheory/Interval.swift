//
//  Interval.swift
//  MusicTheoryKit
//
//  Created by Jin Zhang on 12/12/21.
//

/// A custom musical interval.
public enum Interval: Comparable {
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

extension Interval: CustomStringConvertible {
    /// String representation of the interval.
    public var description: String {
        switch self {
        case .octave    :   return "octave"
        case .m2        :   return "minor second"
        case .M2        :   return "major second"
        case .m3        :   return "minor third"
        case .M3        :   return "major third"
        case .p4        :   return "perfect fourth"
        case .tritone   :   return "tritone"
        case .p5        :   return "perfect fifth"
        case .m6        :   return "minor sixth"
        case .M6        :   return "major sixth"
        case .m7        :   return "minor seventh"
        case .M7        :   return "major seventh"
        }
    }
}

extension Interval {
    /// Create interval based on the number of semitones contained in it.
    public init?(semitone: Int) {
        let semitone = semitone % 12
        switch semitone {
        case 0  :   self = .octave
        case 1  :   self = .m2
        case 2  :   self = .M2
        case 3  :   self = .m3
        case 4  :   self = .M3
        case 5  :   self = .p4
        case 6  :   self = .tritone
        case 7  :   self = .p5
        case 8  :   self = .m6
        case 9  :   self = .M6
        case 10 :   self = .m7
        case 11 :   self = .M7
        default :   return nil
        }
    }
    /// Semitones contained in this interval.
    public var semitones: Int {
        switch self {
        case .octave    : return 0
        case .m2        : return 1
        case .M2        : return 2
        case .m3        : return 3
        case .M3        : return 4
        case .p4        : return 5
        case .tritone   : return 6
        case .p5        : return 7
        case .m6        : return 8
        case .M6        : return 9
        case .m7        : return 10
        case .M7        : return 11
        }
    }
    
    public var isConsonant: Bool {
        switch self {
        case .octave    : return true
        case .m2        : return false
        case .M2        : return false
        case .m3        : return true
        case .M3        : return true
        case .p4        : return true
        case .tritone   : return false
        case .p5        : return true
        case .m6        : return true
        case .M6        : return true
        case .m7        : return false
        case .M7        : return false
        }
    }
}
