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

extension Quality {
    var intervalsFormed: [Interval] {
        switch self {
        case ._5:           return [.p5]
        case .sus2:         return [.M2, .p5]
        case .dim:          return [.m3, .tritone]
        case .m:            return [.m3, .p5]
        case .maj:          return [.M3, .p5]
        case .aug:          return [.M3, .m6]
        case .sus4:         return [.p4, .p5]
        case .dim7:         return [.m3, .tritone, .M6]
        case .m7b5:         return [.m3, .tritone, .m7]
        case ._7_5:         return [.M3, .tritone, .m7]
        case .m6:           return [.m3, .p5, .M6]
        case ._6:           return [.M3, .p5, .M6]
        case .mMaj7:        return [.m3, .p5, .M7]
        case .aug7:         return [.M3, .m6, .m7]
        case ._7sus4:       return [.p4, .p5, .m7]
        case .add9:         return [.M2, .M3, .p5]
        case .add11:        return [.M3, .p4, .p5]
        case .m7:           return [.m3, .p5, .m7]
        case ._7:           return [.M3, .p5, .m7]
        case .maj7:         return [.M3, .p5, .M7]
        case .m9:           return [.M2, .m3, .p5, .m7]
        case ._9:           return [.M2, .M3, .p5, .m7]
        case .maj9:         return [.M2, .M3, .p5, .M7]
        case .m11:          return [.M2, .m3, .p4, .p5, .m7]
        case ._11:          return [.M2, .M3, .p4, .p5, .m7]
        case .maj11:        return [.M2, .M3, .p4, .p5, .M7]
        case .m13:          return [.M2, .m3, .p4, .p5, .M6, .m7]
        case ._13:          return [.M2, .M3, .p4, .p5, .M6, .m7]
        case .maj13:        return [.M2, .M3, .p4, .p5, .M6, .M7]
        }
    }
}

extension Array where Element == Interval {
    var qualityFormed: Quality? {
        switch self {
        case [.p5]:                             return ._5
        case [.M2, .p5]:                        return .sus2
        case [.m3, .tritone]:                   return .dim
        case [.m3, .p5]:                        return .m
        case [.M3, .p5]:                        return .maj
        case [.M3, .m6]:                        return .aug
        case [.p4, .p5]:                        return .sus4
        case [.m3, .tritone, .M6]:              return .dim7
        case [.m3, .tritone, .m7]:              return .m7b5
        case [.M3, .tritone, .m7]:              return ._7_5
        case [.m3, .p5, .M6]:                   return .m6
        case [.M3, .p5, .M6]:                   return ._6
        case [.m3, .p5, .M7]:                   return .mMaj7
        case [.M3, .m6, .m7]:                   return .aug7
        case [.p4, .p5, .m7]:                   return ._7sus4
        case [.M2, .M3, .p5]:                   return .add9
        case [.M3, .p4, .p5]:                   return .add11
        case [.m3, .p5, .m7]:                   return .m7
        case [.M3, .p5, .m7]:                   return ._7
        case [.M3, .p5, .M7]:                   return .maj7
        case [.M2, .m3, .p5, .m7]:              return .m9
        case [.M2, .M3, .p5, .m7]:              return ._9
        case [.M2, .M3, .p5, .M7]:              return .maj9
        case [.M2, .m3, .p4, .p5, .m7]:         return .m11
        case [.M2, .M3, .p4, .p5, .m7]:         return ._11
        case [.M2, .M3, .p4, .p5, .M7]:         return .maj11
        case [.M2, .m3, .p4, .p5, .M6, .m7]:    return .m13
        case [.M2, .M3, .p4, .p5, .M6, .m7]:    return ._13
        case [.M2, .M3, .p4, .p5, .M6, .M7]:    return .maj13
        default:                                return nil
        }
    }
}

extension Quality : CustomStringConvertible {
    var description: String {
        switch self {
        case ._5:       return "5"
        case .sus2:     return "sus2"
        case .dim:      return "dim"
        case .m:        return "m"
        case .maj:      return ""
        case .aug:      return "aug"
        case .sus4:     return "sus4"
        case .dim7:     return "dim7"
        case .m7b5:     return "m7b5"
        case ._7_5:     return "7-5"
        case .m6:       return "m6"
        case ._6:       return "6"
        case .mMaj7:    return "mMaj7"
        case .aug7:     return "aug7"
        case ._7sus4:   return "7sus4"
        case .add9:     return "add9"
        case .add11:    return "add11"
        case .m7:       return "m7"
        case ._7:       return "7"
        case .maj7:     return "maj7"
        case .m9:       return "m9"
        case ._9:       return "9"
        case .maj9:     return "maj9"
        case .m11:      return "m11"
        case ._11:      return "11"
        case .maj11:    return "maj11"
        case .m13:      return "m13"
        case ._13:      return "13"
        case .maj13:    return "maj13"
        }
    }
}

extension String {
    var qualityDescribed: Quality? {
        switch self {
        case "5":       return ._5
        case "sus2":    return .sus2
        case "dim":     return .dim
        case "m":       return .m
        case "":        return .maj
        case "aug":     return .aug
        case "sus4":    return .sus4
        case "dim7":    return .dim7
        case "m7b5":    return .m7b5
        case "7-5":     return ._7_5
        case "m6":      return .m6
        case "6":       return ._6
        case "mMaj7":   return .mMaj7
        case "aug7":    return .aug7
        case "7sus4":   return ._7sus4
        case "add9":    return .add9
        case "add11":   return .add11
        case "m7":      return .m7
        case "7":       return ._7
        case "maj7":    return .maj7
        case "m9":      return .m9
        case "9":       return ._9
        case "maj9":    return .maj9
        case "m11":     return .m11
        case "11":      return ._11
        case "maj11":   return .maj11
        case "m13":     return .m13
        case "13":      return ._13
        case "maj13":   return .maj13
        default:        return nil
        }
    }
}
        
