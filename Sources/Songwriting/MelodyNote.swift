//
//  File.swift
//  
//
//  Created by Jin Zhang on 1/1/22.
//

import MusicTheory
import Foundation

/// A note in melody, with informations like pitch and value.
public struct MelodyNote {
    let note: Note
    let octave: Int
    let value: Value
}

extension MelodyNote {
    /// Create a melody note.
    public init(of note: Note, octave: Int, lasting value: Value) {
        self.note = note
        self.octave = octave > 0 && octave < 8 ? octave : 4
        self.value = value
    }
    /// Pitch of this note.
    public var pitch: Double {
        440.0 * pow(2.0, (Double(self.octave) * 12 + Double(self.note.absolutePosition) - 57.0) / 12.0)
    }
}

