//
//  Mode.swift
//  
//
//  Created by Jin Zhang on 12/24/21.
//

public enum Mode {
    case ionian
    public static let major = ionian
//    case dorian
//    case phrygian
//    case lydian
//    case mixolydian
    case aeolian
    public static let minor = aeolian
//    case locrian
//    case pentatonic
//    case blues
}

extension Mode {
    // The intervals contained in this mode.
    var intervalsContained: [Interval] {
        switch self {
        case .ionian: return [.octave, .M2, .M3, .p4, .p5, .M6, .M7]
        case .aeolian: return [.octave, .M2, .m3, .p4, .p5, .m6, .m7]
        }
    }
}
