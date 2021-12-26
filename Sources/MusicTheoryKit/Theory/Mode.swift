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
    public var intervals: [Interval] {
        modeToInterval[self]!
    }
}
