//
//  Note.swift
//  MusicTheoryKit
//
//  Created by Jin Zhang on 12/11/21.
//

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
public enum Note {
    /// The note C.
    case C
    /// The note C♯.
    case CD
    /// The note D.
    case D
    /// The note D♯
    case DE
    /// The note E.
    case E
    /// The note F.
    case F
    /// The note F♯.
    case FG
    /// The note G.
    case G
    /// The note G♯.
    case GA
    /// The note A.
    case A
    /// The note A♯.
    case AB
    /// The note B.
    case B
}

extension Note {
    /// Initialize a note from its name.
    public init?(_ description: String) {
        switch description {
        case "C"    :  self = .C
        case "C#"   :  self = .CD
        case "Db"   :  self = .CD
        case "D"    :  self = .D
        case "D#"   :  self = .DE
        case "Eb"   :  self = .DE
        case "E"    :  self = .E
        case "F"    :  self = .F
        case "F#"   :  self = .FG
        case "Gb"   :  self = .FG
        case "G"    :  self = .G
        case "G#"   :  self = .GA
        case "Ab"   :  self = .GA
        case "A"    :  self = .A
        case "A#"   :  self = .AB
        case "Bb"   :  self = .AB
        case "B"    :  self = .B
        default     :  return nil
        }
    }
    /// Initialize a note from its absolute position in an octave.
    init?(absolutePosition: Int) {
        switch absolutePosition {
        case 0  :  self = .C
        case 1  :  self = .CD
        case 2  :  self = .D
        case 3  :  self = .DE
        case 4  :  self = .E
        case 5  :  self = .F
        case 6  :  self = .FG
        case 7  :  self = .G
        case 8  :  self = .GA
        case 9  :  self = .A
        case 10 :  self = .AB
        case 11 :  self = .B
        default :  return nil
        }
    }
}

extension Note: Equatable {
    /// Check if two notes are equal or just alias.
    public static func == (lhs: Note, rhs: Note) -> Bool {
        lhs.absolutePosition == rhs.absolutePosition
    }
}

extension Note: Hashable {
    /// Hash function.
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.absolutePosition)
    }
}

extension Note: CustomStringConvertible {
    public var description: String {
        switch self {
        case .C:       return "C"
        case .CD:      return "CD"
        case .D:       return "D"
        case .DE:      return "DE"
        case .E:       return "E"
        case .F:       return "F"
        case .FG:      return "FG"
        case .G:       return "G"
        case .GA:      return "GA"
        case .A:       return "A"
        case .AB:      return "AB"
        case .B:       return "B"
        }
    }
}

extension Note {
    /// Absolute position of the note, for conveience of calulation.
    ///
    /// By default, C is 0, C# is 1, ..., B is 11.
    public var absolutePosition: Int {
        switch self {
        case .C:       return 0
        case .CD:      return 1
        case .D:       return 2
        case .DE:      return 3
        case .E:       return 4
        case .F:       return 5
        case .FG:      return 6
        case .G:       return 7
        case .GA:      return 8
        case .A:       return 9
        case .AB:      return 10
        case .B:       return 11
        }
    }
    /// See if this note is consonant with another.
    public func isConsonant(with anotherNote: Note) -> Bool {
        (self - anotherNote).isConsonant
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
        let sum = lhs.absolutePosition + rhs.semitones
        return .init(absolutePosition: sum < 12 ? sum : sum - 12)!
        
    }
    /// Compute the note a certain Interval below it.
    ///
    /// - Parameters:
    ///   - lhs: Base note.
    ///   - rhs: Interval below the base note.
    /// - Returns: The note a specified interval below the base note.
    public static func - (_ lhs: Self, _ rhs: Interval) -> Self {
        let difference = lhs.absolutePosition - rhs.semitones
        return .init(absolutePosition: difference >= 0 ? difference : difference + 12)!

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
        let difference = lhs.absolutePosition - rhs.absolutePosition
        return Interval(semitone: difference > 0 ? difference : difference + 12)!
    }
}



