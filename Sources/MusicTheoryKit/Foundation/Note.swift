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
public enum Note: String, CaseIterable {
    /// Musical note.
    case C, Db, D, Eb, E, F, Gb, G, Ab, A, Bb, B
    /// Compute the note a certain Interval above it.
    ///
    /// - Parameters:
    ///   - lhs: Base note.
    ///   - rhs: Interval above the base note.
    /// - Returns: The note a specified interval above the base note.
    public static func + (_ lhs: Note, _ rhs: Interval) -> Note {
        let sum = lhs.num + rhs.num
        return Note(sum <= 12 ? sum : sum - 12)!
    }
    /// Compute the note a certain Interval below it.
    ///
    /// - Parameters:
    ///   - lhs: Base note.
    ///   - rhs: Interval below the base note.
    /// - Returns: The note a specified interval below the base note.
    public static func - (_ lhs: Note, _ rhs: Interval) -> Note {
        let difference = lhs.num - rhs.num
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
        let difference = lhs.num - rhs.num
        return Interval(semitone: difference > 0 ? difference : difference + 12)!
    }
    
    //------------------- Not Part of API --------------------------//
    private init?(_ num: Int) {
        guard let note = Note.intToNote[num] else {
            return nil
        }
        self = note
    }
    
    private var num: Int {
        Note.noteToInt[self]!
    }
    
    static let noteToInt = [
        C: 1, Db: 2, D: 3, Eb: 4, E: 5, F: 6,
        Gb: 7, G: 8, Ab: 9, A: 10, Bb: 11, B: 12
    ]
    
    private static let intToNote = [
        1: C, 2: Db, 3: D, 4: Eb, 5: E, 6: F,
        7: Gb, 8: G, 9: Ab, 10: A, 11: Bb, 12: B
    ]
}
