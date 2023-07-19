/// A custom note.
///
/// Create a Note either by using its name:
/// ```swift
/// Note("D#")  // Note.DE
/// ```
/// or by directly using enum cases:
/// ```swift
/// Note.B_flat
/// ```
/// Flat and sharp versions are equivalent for the same note.
/// ```swift
/// Note("C#") == Note("Db")  // true
/// ```
public enum Note: Int, Hashable {
    case C, CD, D, DE, E, F, FG, G, GA, A, AB, B
    /// Initialize a note from its name.
    public init?(_ description: String) {
        if let note = nameToNote[description] { self = note }
        else { return nil }
    }
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.rawValue)
    }
    /// Check if this note is in a specific chord.
    public func isIn(chord: Chord) -> Bool {
        chord.content.contains(self)
    }
    /// Check if this note is in a specific scale.
    public func isIn(scale: Scale) -> Bool {
        scale.notes.contains(self)
    }
    /// Compute the note a certain Interval above it.
    ///
    /// - Parameters:
    ///   - lhs: Base note.
    ///   - rhs: Interval above the base note.
    /// - Returns: The note a specified interval above the base note.
    public static func + (_ lhs: Self, _ rhs: Interval) -> Self {
        let sum = lhs.rawValue + rhs.semitones
        return .init(rawValue: sum < 12 ? sum : sum - 12)!
        
    }
    /// Compute the note a certain Interval below it.
    ///
    /// - Parameters:
    ///   - lhs: Base note.
    ///   - rhs: Interval below the base note.
    /// - Returns: The note a specified interval below the base note.
    public static func - (_ lhs: Self, _ rhs: Interval) -> Self {
        let difference = lhs.rawValue - rhs.semitones
        return .init(rawValue: difference >= 0 ? difference : difference + 12)!

    }
    /// Compute the Interval between two notes within an octave.
    ///
    /// The following expression will return ``Interval``.
    /// ```swift
    /// Note.D - Note.E
    /// ```
    /// - Parameters:
    ///   - lhs: The higher note.
    ///   - rhs: The lower note.
    /// - Returns: The interval between the two notes.
    public static func - (_ lhs: Note, _ rhs: Note) -> Interval {
        let difference = lhs.rawValue - rhs.rawValue
        return Interval(semitone: difference > 0 ? difference : difference + 12)
    }
}


