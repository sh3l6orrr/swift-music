/// A mode that requires a root to form a scale.
public enum Mode: CaseIterable, Equatable {
    case major, minor
    /// Check for mode equivalence.
    ///
    /// See if two modes are simply alias of each other, for example,
    /// .major and .ionian are equal.
    public static func == (lhs: Mode, rhs: Mode) -> Bool {
        lhs.intervalsContained == rhs.intervalsContained
    }
    /// The intervals contained in this mode.
    var intervalsContained: [Interval] {
        switch self {
        case .major     :   return [.octave, .M2, .M3, .p4, .p5, .M6, .M7]
        case .minor     :   return [.octave, .M2, .m3, .p4, .p5, .m6, .m7]
        }
        
    }
}

