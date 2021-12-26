//
//  Note.swift
//  MusicTheoryKit
//
//  Created by Jin Zhang on 12/11/21.
//

/// A custom musical note.
///
/// Create a Note either by using rawValue:
/// ```swift
/// Note("E")
/// ```
/// or by directly using enum cases:
/// ```swift
/// Note.Bb
/// ```
/// > Only flats are currently supported. For example, the note above C is Db, instead of C#.
public enum Note : String, CaseIterable  {
    /// The musical note C.
    case C
    /// The musical note Db.
    case Db
    public static let Cs = Db
    /// The musical note D.
    case D
    /// The musical note Eb.
    case Eb
    public static let Ds = Eb
    /// The musical note E.
    case E
    /// The musical note F.
    case F
    /// The musical note Gb.
    case Gb
    public static let Fs = Gb
    /// The musical note G.
    case G
    /// The musical note Ab.
    case Ab
    public static let Gs = Ab
    /// The musical note A.
    case A
    /// The musical note Bb.
    case Bb
    public static let As = Bb
    /// The musical note B.
    case B
    // For helping note arithemetics.
    private init?(_ num: Int) {
        guard let note = intToNote[num] else { return nil }
        self = note
    }
}


extension Note {
    /// Check if this note is in a specific scale.
    public var isIn: (Scale) -> Bool {{ scale in
        scale.notes.contains(self)
    }}
    /// Compute the note a certain Interval above it.
    ///
    /// - Parameters:
    ///   - lhs: Base note.
    ///   - rhs: Interval above the base note.
    /// - Returns: The note a specified interval above the base note.
    public static func + (_ lhs: Note, _ rhs: Interval) -> Note {
        let sum = noteToInt[lhs]! + IntervalToInt[rhs]!
        return Note(sum <= 12 ? sum : sum - 12)!
    }
    /// Compute the note a certain Interval below it.
    ///
    /// - Parameters:
    ///   - lhs: Base note.
    ///   - rhs: Interval below the base note.
    /// - Returns: The note a specified interval below the base note.
    public static func - (_ lhs: Note, _ rhs: Interval) -> Note {
        let difference = noteToInt[lhs]! - IntervalToInt[rhs]!
        return Note(difference > 0 ? difference : difference + 12)!
    }
    /// Compute the Interval between two notes within an octave.
    ///
    /// The following expression will return ``Interval/m7-1ygiw``.
    /// ```swift
    /// Note.D - Note.E
    /// ```
    /// - Parameters:
    ///   - lhs: The higher note.
    ///   - rhs: The lower note.
    /// - Returns: The interval between the two notes.
    public static func - (_ lhs: Note, _ rhs: Note) -> Interval {
        let difference = noteToInt[lhs]! - noteToInt[rhs]!
        return Interval(semitone: difference > 0 ? difference : difference + 12)!
    }
}

