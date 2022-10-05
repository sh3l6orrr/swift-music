//
//  Chord.swift
//  MusicTheoryKit
//
//  Created by Jin Zhang on 12/13/21.
//

/// A custom musical chord.
///
/// As someone familiar with music theory might expect, a custom chord has its
/// component notes and a root note. The chord's quality is determined by these notes.
public struct Chord {
    // The root of this chord.
    public let root: Note
    // Set of notes in the chord.
    var notes: Set<Note>
    /// Create a chord by specifying root, notes, and slash.
    public init(_ root: Note, notes: Set<Note>) {
        self.root = root
        self.notes = notes
        self.notes.insert(root)
    }
    /// Create a chord by specifying root, quality, and slash.
    public init(_ root: Note, _ quality: Quality) {
        let notes = Set(quality.intervalsFormed.map{ root + $0 })
        self.init(root, notes: notes)
    }
}

extension Chord: Equatable {}

extension Chord {
    /// If this is a currently supported chord.
    public var isRecognized: Bool {
        self.quality != nil
    }
    /// Check if a note is in the chord.
    public func contains(note: Note) -> Bool {
        self.content.contains(note)
    }
    /// Intervals in the chord.
    public var intervals: [Interval] {
        notes.map { note in
            note - self.root
        }
        .sorted()
    }
    /// Content notes of the chord.
    public var content: [Note] {
        intervals.map { interval in
            root + interval
        }
    }
    /// Quality of the chord.
    public var quality: Quality? {
        self.intervals.qualityFormed
    }
    /// Check if the chord is in a certain scale.
    public func isIn(scale: Scale) -> Bool {
        self.notes.isSubset(of: scale.notes)
    }
}
