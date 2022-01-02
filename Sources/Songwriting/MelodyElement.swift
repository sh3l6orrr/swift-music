//
//  MelodyElement.swift
//  
//
//  Created by Jin Zhang on 1/1/22.
//

import MusicTheory

/// An element in a melody, either a note or a pause.
public enum MelodyElement {
    case note(MelodyNote)
    case pause(Value)
}

extension MelodyElement {
    /// Value of the element.
    public var value: Value {
        switch self {
        case .note(let melodyNote):
            return melodyNote.value
        case .pause(let value):
            return value
        }
    }
}
