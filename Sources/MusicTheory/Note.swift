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
/// Note("D#")  // Note.D_sharp
/// ```
/// or by directly using enum cases:
/// ```swift
/// Note.B_flat
/// ```
/// Flat and sharp versions are equivalent for the same note.
/// ```swift
/// Note("C#") == Note("Db")  // true
/// ```
public enum Note: CaseIterable {
    /// The note C.
    case C
    /// The note C♯.
    case C_sharp
    /// The note D♭.
    case D_flat
    /// The note D.
    case D
    /// The note D♯
    case D_sharp
    /// The note E♭.
    case E_flat
    /// The note E.
    case E
    /// The note F.
    case F
    /// The note F♯.
    case F_sharp
    /// The note G♭.
    case G_flat
    /// The note G.
    case G
    /// The note G♯.
    case G_sharp
    /// The note A♭.
    case A_flat
    /// The note A.
    case A
    /// The note A♯.
    case A_sharp
    /// The note B♭.
    case B_flat
    /// The note B.
    case B
}

extension Note: LosslessStringConvertible {
    /// Initialize a note from its name.
    public init?(_ description: String) {
        switch description {
        case "C"    :  self = .C
        case "C#"   :  self = .C_sharp
        case "Db"   :  self = .D_flat
        case "D"    :  self = .D
        case "D#"   :  self = .D_sharp
        case "Eb"   :  self = .E_flat
        case "E"    :  self = .E
        case "F"    :  self = .F
        case "F#"   :  self = .F_sharp
        case "Gb"   :  self = .G_flat
        case "G"    :  self = .G
        case "G#"   :  self = .G_sharp
        case "Ab"   :  self = .A_flat
        case "A"    :  self = .A
        case "A#"   :  self = .A_sharp
        case "Bb"   :  self = .B_flat
        case "B"    :  self = .B
        default     :  return nil
        }
    }
    /// Name of the note.
    public var description: String {
        switch self {
        case .C         :   return "C"
        case .C_sharp   :   return "C#"
        case .D_flat    :   return "Db"
        case .D         :   return "D"
        case .D_sharp   :   return "D#"
        case .E_flat    :   return "Eb"
        case .E         :   return "E"
        case .F         :   return "F"
        case .F_sharp   :   return "F#"
        case .G_flat    :   return "Gb"
        case .G         :   return "G"
        case .G_sharp   :   return "G#"
        case .A_flat    :   return "Ab"
        case .A         :   return "A"
        case .A_sharp   :   return "A#"
        case .B_flat    :   return "Bb"
        case .B         :   return "B"
        }
    }
}

extension Note {
    /// Initialize a note from its absolute position in an octave.
    init?(_ absolutePosition: Int) {
        switch absolutePosition {
        case 1  :  self = .C
        case 2  :  self = .C_sharp
        case 3  :  self = .D
        case 4  :  self = .D_sharp
        case 5  :  self = .E
        case 6  :  self = .F
        case 7  :  self = .F_sharp
        case 8  :  self = .G
        case 9  :  self = .G_sharp
        case 10 :  self = .A
        case 11 :  self = .A_sharp
        case 12 :  self = .B
        default :  return nil
        }
    }
    /// Absolute position of the note.
    var absolutePosition: Int {
        switch self {
        case .C:            return 1
        case .C_sharp:      return 2
        case .D_flat:       return 2
        case .D:            return 3
        case .D_sharp:      return 4
        case .E_flat:       return 4
        case .E:            return 5
        case .F:            return 6
        case .F_sharp:      return 7
        case .G_flat:       return 7
        case .G:            return 8
        case .G_sharp:      return 9
        case .A_flat:       return 9
        case .A:            return 10
        case .A_sharp:      return 11
        case .B_flat:       return 11
        case .B:            return 12
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

extension Note {
    /// See if this note is consonant with another.
    public func isConsonant(with anotherNote: Note) -> Bool {
        (self - anotherNote).isConsonant
    }
    /// Check if this note is in a specific chord.
    public func isIn(chord: Chord) -> Bool {
        chord.allNotes.contains(self)
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
    public static func + (_ lhs: Note, _ rhs: Interval) -> Note {
        let sum = lhs.absolutePosition + rhs.semitones
        return Note(sum <= 12 ? sum : sum - 12)!
    }
    /// Compute the note a certain Interval below it.
    ///
    /// - Parameters:
    ///   - lhs: Base note.
    ///   - rhs: Interval below the base note.
    /// - Returns: The note a specified interval below the base note.
    public static func - (_ lhs: Note, _ rhs: Interval) -> Note {
        let difference = lhs.absolutePosition - rhs.semitones
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
        let difference = lhs.absolutePosition - rhs.absolutePosition
        return Interval(semitone: difference > 0 ? difference : difference + 12)!
    }
}



