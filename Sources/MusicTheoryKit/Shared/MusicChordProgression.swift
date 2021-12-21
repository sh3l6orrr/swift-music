//
//  MusicChordProgression.swift
//  
//
//  Created by Jin Zhang on 12/19/21.
//

/// A chord that can be played in a song, which has information of pitch,
/// value, and velocity.
public struct MusicChordProgression : ChordProgressionElement {
    /// Create a ChordProgression by specifying pitch, value, and velocity.
    ///
    /// To create a valid Music ChordProgression, the pitch must be in the range A0 - C8,
    /// and the velocity must be in the range 0...127.
    /// For example:
    /// ```swift
    /// let ChordProgression = MusicChordProgression(.C, octave: 8, value: ._4, velocity: 64)! // OK
    /// let ChordProgression = MusicChordProgression(.D, octave: 8, value: ._4, velocity: 128)? // Returns nil
    /// ```
    /// If no value and velocity is specified, they will be default to
    /// quarter ChordProgression and 64 respectively.
//    public init?(_ pitch: String, value: Value = ._64) {
//        guard pitch.count == 2 else { return nil }
//        guard let ChordProgression = ChordProgression(rawValue: pitch[0]) else { return nil }
//        guard let octave = Int(pitch[1]) else { return nil }
//        guard octave >= 0 && octave <= 8 else { return nil }
//        if octave == 0 { guard ChordProgression == .A || ChordProgression == .Bb || ChordProgression == .B else { return nil }}
//        if octave == 8 { guard ChordProgression == .C else { return nil }}
//        self.chordProgression = ChordProgression
//        self.octave = octave
//        self.value = value
//        self.pitch = pitch
//    }
    /// The underlying ChordProgression.
    public let chordProgression: ChordProgression
    /// The octave this ChordProgression is in.
    public let octave: Int
    /// The pitch of the ChordProgression.
    public let pitch: String
    /// The frequency of the nore.

    /// The value of the ChordProgression.
    public let value: Value
}
