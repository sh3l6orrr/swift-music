//
//  MusicNote.swift
//  MusicTheoryKit
//
//  Created by Jin Zhang on 12/16/21.
//

import Foundation
import StringSubscripts

/// A note that can be played in a song, which has information of pitch,
/// value, and velocity.
public struct MusicNote : MelodyElement {
    /// The underlying note.
    public let note: Note
    /// The octave this note is in.
    public let octave: Int
    /// The pitch of the note.
    let pitch: String
    /// The value of the note.
    public let value: Value
}

extension MusicNote {
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
    public init?(_ pitch: String, value: Value = ._64) {
        guard pitch.count == 2 else { return nil }
        guard let note = Note(rawValue: pitch[0]) else { return nil }
        guard let octave = Int(pitch[1]) else { return nil }
        guard octave >= 0 && octave <= 8 else { return nil }
        if octave == 0 { guard note == .A || note == .Bb || note == .B else { return nil }}
        if octave == 8 { guard note == .C else { return nil }}
        self.note = note
        self.octave = octave
        self.value = value
        self.pitch = pitch
    }
    /// The frequency of the nore.
    public var frequency: Float {
        let relative = Float(noteToInt[self.note]! - 10 + 12 * (octave - 4))
        return Float(Float(440) * pow(Float(2),(relative/Float(12))))
    }
}
