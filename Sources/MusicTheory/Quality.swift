//
//  Quality.swift
//  
//
//  Created by Jin Zhang on 12/25/21.
//

enum Quality {
    /// Known as the power chord.
    case _5
    case sus2
    case dim
    /// A sad minor chord.
    case m
    /// The very familiar major happy chord.
    case maj
    case aug
    case sus4
    case dim7
    case m7b5
    case _7_5
    case m6
    case _6
    case mMaj7
    case aug7
    case _7sus4
    case add9
    case add11
    case m7
    /// The characteristic dominant chord.
    case _7
    case maj7
    case m9
    case _9
    case maj9
    case m11
    case _11
    case maj11
    case m13
    case _13
    case maj13
}

extension Quality : CustomStringConvertible {
    var description: String {
        switch self {
        case ._5: return "5"
        case .sus2: return "sus2"
        case .dim: return "dim"
        case .m: return "m"
        case .maj: return ""
        case .aug: return "aug"
        case .sus4: return "sus4"
        case .dim7: return "dim7"
        case .m7b5: return "m7b5"
        case ._7_5: return "7-5"
        case .m6: return "m6"
        case ._6: return "6"
        case .mMaj7: return "mmaj7"
        case .aug7: return "aug7"
        case ._7sus4: return "7sus4"
        case .add9: return "add9"
        case .add11: return "add11"
        case .m7: return "m7"
        case ._7: return "7"
        case .maj7: return "maj7"
        case .m9: return "m9"
        case ._9: return "9"
        case .maj9: return "maj9"
        case .m11: return "m11"
        case ._11: return "11"
        case .maj11: return "maj11"
        case .m13: return "m13"
        case ._13: return "13"
        case .maj13: return "maj13"
        }
    }
}
