//
//  MusicNote.swift
//  MusicTheoryKit
//
//  Created by Jin Zhang on 12/16/21.
//

/// A note that can be played in a song, which has information of pitch,
/// value, and velocity.
public struct MusicNote {
    /// Create a note by specifying pitch, value, and velocity.
    public init(_ note: Note, octave: Int, value: Value, velocity: Int) {
        var newOctave = octave
        var newVelocity = velocity
        if octave < 0 { newOctave = 0 }
        if octave > 8 { newOctave = 8 }
        if velocity < 0 { newVelocity = 0 }
        if velocity > 127 { newVelocity = 127 }
        self.note = note
        self.octave = newOctave
        self.value = value
        self.velocity = newVelocity
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
