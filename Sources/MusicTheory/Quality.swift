//
//  Quality.swift
//  
//
//  Created by Jin Zhang on 12/25/21.
//

/// Quality of a chord.
public enum Quality: CaseIterable {
    /// Known as the power chord.
    case power
    case suspended2ndTriad
    /// The very inharmonic diminished chord.
    case diminishedTriad
    /// A sad minor chord.
    case minorTriad
    /// The very familiar major happy chord.
    case majorTriad
    case augmentedTriad
    case suspended4thTriad
    case diminishedSeventh
    case halfDiminishedSeventh
    case dominantSeventhWithFlat5th
    case minorSixth
    case majorSixth
    case minorMajorSeventh
    case augmentedSeventh
    case dominantSeventhWithSuspended4th
    case minorTriadAdded9th
    case majorTriadAdded9th
    case minorTriadAdded11th
    case majorTriadAdded11th
    case minorSeventh
    /// The characteristic dominant chord.
    case dominantSeventh
    case majorSeventh
    case minorNinth
    case dominantNinth
    case majorNinth
}

extension Quality {
    var intervalsFormed: [Interval] {
        switch self {
        case .power:                            return [.octave, .p5]
        case .suspended2ndTriad:                return [.octave, .M2, .p5]
        case .diminishedTriad:                  return [.octave, .m3, .tritone]
        case .minorTriad:                       return [.octave, .m3, .p5]
        case .majorTriad:                       return [.octave, .M3, .p5]
        case .augmentedTriad:                   return [.octave, .M3, .m6]
        case .suspended4thTriad:                return [.octave, .p4, .p5]
        case .diminishedSeventh:                return [.octave, .m3, .tritone, .M6]
        case .halfDiminishedSeventh:            return [.octave, .m3, .tritone, .m7]
        case .dominantSeventhWithFlat5th:       return [.octave, .M3, .tritone, .m7]
        case .minorSixth:                       return [.octave, .m3, .p5, .M6]
        case .majorSixth:                       return [.octave, .M3, .p5, .M6]
        case .minorMajorSeventh:                return [.octave, .m3, .p5, .M7]
        case .augmentedSeventh:                 return [.octave, .M3, .m6, .m7]
        case .dominantSeventhWithSuspended4th:  return [.octave, .p4, .p5, .m7]
        case .minorTriadAdded9th:               return [.octave, .M2, .m3, .p5]
        case .majorTriadAdded9th:               return [.octave, .M2, .M3, .p5]
        case .minorTriadAdded11th:              return [.octave, .m3, .p4, .p5]
        case .majorTriadAdded11th:              return [.octave, .M3, .p4, .p5]
        case .minorSeventh:                     return [.octave, .m3, .p5, .m7]
        case .dominantSeventh:                  return [.octave, .M3, .p5, .m7]
        case .majorSeventh:                     return [.octave, .M3, .p5, .M7]
        case .minorNinth:                       return [.octave, .M2, .m3, .p5, .m7]
        case .dominantNinth:                    return [.octave, .M2, .M3, .p5, .m7]
        case .majorNinth:                       return [.octave, .M2, .M3, .p5, .M7]
        }
    }
}

extension Array where Element == Interval {
    var qualityFormed: Quality? {
        switch self {
        case [.octave, .p5]:                             return .power
        case [.octave, .M2, .p5]:                        return .suspended2ndTriad
        case [.octave, .m3, .tritone]:                   return .diminishedTriad
        case [.octave, .m3, .p5]:                        return .minorTriad
        case [.octave, .M3, .p5]:                        return .majorTriad
        case [.octave, .M3, .m6]:                        return .augmentedTriad
        case [.octave, .p4, .p5]:                        return .suspended4thTriad
        case [.octave, .m3, .tritone, .M6]:              return .diminishedSeventh
        case [.octave, .m3, .tritone, .m7]:              return .halfDiminishedSeventh
        case [.octave, .M3, .tritone, .m7]:              return .dominantSeventhWithFlat5th
        case [.octave, .m3, .p5, .M6]:                   return .minorSixth
        case [.octave, .M3, .p5, .M6]:                   return .majorSixth
        case [.octave, .m3, .p5, .M7]:                   return .minorMajorSeventh
        case [.octave, .M3, .m6, .m7]:                   return .augmentedSeventh
        case [.octave, .p4, .p5, .m7]:                   return .dominantSeventhWithSuspended4th
        case [.octave, .M2, .m3, .p5]:                   return .minorTriadAdded9th
        case [.octave, .M2, .M3, .p5]:                   return .majorTriadAdded9th
        case [.octave, .m3, .p4, .p5]:                   return .minorTriadAdded11th
        case [.octave, .M3, .p4, .p5]:                   return .majorTriadAdded11th
        case [.octave, .m3, .p5, .m7]:                   return .minorSeventh
        case [.octave, .M3, .p5, .m7]:                   return .dominantSeventh
        case [.octave, .M3, .p5, .M7]:                   return .majorSeventh
        case [.octave, .M2, .m3, .p5, .m7]:              return .minorNinth
        case [.octave, .M2, .M3, .p5, .m7]:              return .dominantNinth
        case [.octave, .M2, .M3, .p5, .M7]:              return .majorNinth
        default:                                return nil
        }
    }
}

extension Quality : LosslessStringConvertible {
    /// Create a quality from string.
    public init?(_ description: String) {
        switch description {
        case "5":       self = .power
        case "sus2":    self = .suspended2ndTriad
        case "dim":     self = .diminishedTriad
        case "m":       self = .minorTriad
        case "":        self = .majorTriad
        case "aug":     self = .augmentedTriad
        case "sus4":    self = .suspended4thTriad
        case "dim7":    self = .diminishedSeventh
        case "m7b5":    self = .halfDiminishedSeventh
        case "7-5":     self = .dominantSeventhWithFlat5th
        case "m6":      self = .minorSixth
        case "6":       self = .majorSixth
        case "mMaj7":   self = .minorMajorSeventh
        case "aug7":    self = .augmentedSeventh
        case "7sus4":   self = .dominantSeventhWithSuspended4th
        case "madd9":   self = .minorTriadAdded9th
        case "add9":    self = .majorTriadAdded9th
        case "madd11":  self = .minorTriadAdded11th
        case "add11":   self = .majorTriadAdded11th
        case "m7":      self = .minorSeventh
        case "7":       self = .dominantSeventh
        case "maj7":    self = .majorSeventh
        case "m9":      self = .minorNinth
        case "9":       self = .dominantNinth
        case "maj9":    self = .majorNinth
        default:        return nil
        }
    }
    /// Name of a quality.
    public var description: String {
        switch self {
        case .power:                            return "5"
        case .suspended2ndTriad:                return "sus2"
        case .diminishedTriad:                  return "dim"
        case .minorTriad:                       return "m"
        case .majorTriad:                       return ""
        case .augmentedTriad:                   return "aug"
        case .suspended4thTriad:                return "sus4"
        case .diminishedSeventh:                return "dim7"
        case .halfDiminishedSeventh:            return "m7b5"
        case .dominantSeventhWithFlat5th:       return "7-5"
        case .minorSixth:                       return "m6"
        case .majorSixth:                       return "6"
        case .minorMajorSeventh:                return "mMaj7"
        case .augmentedSeventh:                 return "aug7"
        case .dominantSeventhWithSuspended4th:  return "7sus4"
        case .minorTriadAdded9th:               return "madd9"
        case .majorTriadAdded9th:               return "add9"
        case .minorTriadAdded11th:              return "madd11"
        case .majorTriadAdded11th:              return "add11"
        case .minorSeventh:                     return "m7"
        case .dominantSeventh:                  return "7"
        case .majorSeventh:                     return "maj7"
        case .minorNinth:                       return "m9"
        case .dominantNinth:                    return "9"
        case .majorNinth:                       return "maj9"
        }
    }
}
