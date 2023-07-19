/// A custom musical chord.
///
/// As someone familiar with music theory might expect, a custom chord has its
/// component notes and a root note. The chord's quality is determined by these notes.
public struct Chord: Equatable {
    // The root of this chord.
    public let root: Note
    // Set of notes in the chord.
    public var notes: Set<Note>
    /// Create a chord by specifying root, notes, and slash.
    public init(_ root: Note, notes: [Note]) {
        self.root = root
        self.notes = Set(notes)
        self.notes.insert(root)
        
    }
    /// Create a chord by specifying root, quality, and slash.
    public init(_ root: Note, _ quality: Quality) {
        let notes = quality.intervalsFormed.map { root + $0 }
        self.init(root, notes: notes)
    }
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
        notes.map { $0 - self.root }.sorted()
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
