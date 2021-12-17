//
//  MusicNote.swift
//  MusicTheoryKit
//
//  Created by Jin Zhang on 12/16/21.
//

/// A note that can be played in a song, which has information of pitch,
/// value, and velocity.
public struct MusicNote: MelodyElement {
    /// Create a note by specifying pitch, value, and velocity.
    ///
    /// To create a valid Music note, the pitch must be in the range A0 - C8,
    /// and the velocity must be in the range 0...127.
    /// For example:
    /// ```swift
    /// let note = MusicNote(.C, octave: 8, value: ._4, velocity: 64)! // OK
    /// let note = MusicNote(.D, octave: 8, value: ._4, velocity: 128)? // Returns nil
    /// ```
    /// If no value and velocity is specified, they will be default to
    /// quarter note and 64 respectively.
    public init?(_ note: Note, octave: Int, value: Value = ._64, velocity: Int = 64) {
        guard octave >= 0 && octave <= 8 else { return nil }
        guard velocity >= 0 && velocity <= 127 else { return nil }
        if octave == 0 { guard note == .A || note == .Bb || note == .B else { return nil }}
        if octave == 8 { guard note == .C else { return nil }}
        self.note = note
        self.octave = octave
        self.value = value
        self.velocity = velocity
    }
    /// The underlying note.
    public let note: Note
    /// The octave this note is in.
    public let octave: Int
    /// The pitch of the note.
    public var pitch: String { note.rawValue + String(octave) }
    /// The value of the note.
    public let value: Value
    /// The velociy of the note.
    public let velocity: Int
}
