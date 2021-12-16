//
//  MelodyElement.swift
//  
//
//  Created by Jin Zhang on 12/16/21.
//

/// Element in a monophonic melody.
public enum MelodyElement {
    /// The element is a pause.
    case pause(Pause)
    /// The element is a note with pitch, value, and velocity.
    case musicNote(MusicNote)
    /// Return the value of the melody element.
    public var value: Value {
        if case let MelodyElement.pause(pause) = self {
            return pause.value
        }
        if case let MelodyElement.musicNote(musicNote) = self {
            return musicNote.value
        }
        else { return ._1 }
    }
}
