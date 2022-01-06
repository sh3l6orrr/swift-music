//
//  Mode.swift
//  
//
//  Created by Jin Zhang on 12/24/21.
//

/// A mode that requires a root to form a scale.
public enum Mode: CaseIterable {
    case ionian
    case major
//    case dorian
//    case phrygian
//    case lydian
//    case mixolydian
    case aeolian
    case minor
//    case locrian
//    case pentatonic
//    case blues
}

extension Mode {
    /// The intervals contained in this mode.
    var intervalsContained: [Interval] {
        switch self {
        case .ionian    :   return [.octave, .M2, .M3, .p4, .p5, .M6, .M7]
        case .major     :   return [.octave, .M2, .M3, .p4, .p5, .M6, .M7]
        case .aeolian   :   return [.octave, .M2, .m3, .p4, .p5, .m6, .m7]
        case .minor     :   return [.octave, .M2, .m3, .p4, .p5, .m6, .m7]
        }
    }
}

extension Mode: Equatable {
    /// Check for mode equivalence.
    ///
    /// See if two modes are simply alias of each other, for example,
    /// .major and .ionian are equal.
    public static func == (lhs: Mode, rhs: Mode) -> Bool {
        lhs.intervalsContained == rhs.intervalsContained
    }
}

extension Mode: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(intervalsContained)
    }
}