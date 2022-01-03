//
//  Scale.swift
//  
//
//  Created by Jin Zhang on 12/24/21.
//

/// A scale.
///
/// Note that in this module, scale are specifically constructed from the seven modes.
/// If you are looking for other scales, go to Key.
public struct Scale {
    let tonic: Note
    let mode: Mode
}

extension Scale {
    /// Init a scale by specifying tonic and mode.
    public init(_ tonic: Note, _ mode: Mode) {
        self.tonic = tonic
        self.mode = mode
    }
    /// All notes in the scale starting from the tonic.
    public var notes: [Note] {
        self.mode.intervalsContained.map { interval in
            self.tonic + interval
        }
    }
    /// All triads in the scale ordered from I to VII.
    public var allTriads: [Chord] {
        self.notes.enumerated().map { index, note in
            let secondNote = self.notes[index + 2 > 6 ? index - 5 : index + 2]
            let thirdNote = self.notes[index + 4 > 6 ? index - 3 : index + 4]
            return Chord(root: note, [secondNote, thirdNote])
        }
    }
    /// The triad at a degree.
    public func triad(degree: Int) -> Chord {
        return self.allTriads[degree - 1]
    }
}

