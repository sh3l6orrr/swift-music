//
//  Scale.swift
//  
//
//  Created by Jin Zhang on 12/24/21.
//

/// A scale, or key.
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
}

