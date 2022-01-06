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
    let notes: Set<Note>
    // The note this chord is over.
    public let slash: Note?
}

extension Chord: Equatable {}

extension Chord {
    /// If this is a currently supported chord.
    public var isRecognized: Bool {
        self.quality != nil
    }
    /// All notes in the chord, including root and slash.
    public var allNotes: Set<Note> {
        var allNotes = self.notes
        allNotes.insert(root)
        if let slash = self.slash {
            allNotes.insert(slash)
        }
        return allNotes
    }
    /// Check if a note is in the chord.
    public func contains(note: Note) -> Bool {
        note.isIn(chord: self)
    }
    /// Intervals in the chord.
    var intervals: [Interval] {
        notes.compactMap { note in
            note == root || note == slash
            ? nil
            : note - self.root
        }
        .sorted()
    }
    /// Quality of the chord.
    var quality: Quality? {
        self.intervals.qualityFormed
    }
    /// Check if the chord is in a certain scale.
    public func isIn(scale: Scale) -> Bool {
        self.notes.isSubset(of: scale.notes)
    }
    /// Summary of the chord.
    public var summary: String {
        if quality != nil {
            let ifSlash = slash != nil && slash != root ? " slash" : ""
            let slash = slash != nil && slash != root ? " over \(slash!.description)" : ""
            let notes = intervals.map{ (root + $0).description }.joined(separator: ", ")
            let intervals = intervals.map{ $0.description }.joined(separator: ", ")
            return 
                "This is a\(ifSlash) chord named \(self.description)\(slash), "
                + "with root note \(root), "
                + "and component notes \(notes), "
                + "which are respectively \(intervals) above the root."
        } else {
            return "This chord is not identified."
        }
    }
}

extension Chord: CustomStringConvertible {
    /// The name of a chord.
    ///
    /// The following code generate a chord with name "Esus4"
    /// ```swift
    /// let chord = Chord(root: .E, [.E, .A, .B])
    /// ```
    public var description: String {
        if let quality = self.quality?.description {
            return slash != nil && slash != root
            ? root.description + quality + "/" + slash!.description
            : root.description + quality
        } else {
            return "Not Identified"
        }
    }
}

extension Chord {
    /// Create a chord by specifying root, notes, and slash.
    public init(_ root: Note, notes: Set<Note>, over slash: Note? = nil) {
        self.root = root
        self.notes = notes
        self.slash = root == slash ? nil : slash
    }
    /// Create a chord by specifying root, quality, and slash.
    public init(_ root: Note, _ quality: Quality, over slash: Note? = nil) {
        let notes = Set(quality.intervalsFormed.map{ root + $0 })
        self.init(root, notes: notes, over: slash)
    }
    /// Failures that can occur when creating chord from string literal.
    enum CreationFailures: Error {
        case unrecognizedRoot
        case unrecognizedSlash
        case unrecognizedQuality
        case slashOverlapsRoot
        case tooManySlashes
    }
    /// Create a chord directly from it's name.
    ///
    /// Create a chord by using it's name directly.
    /// ```swift
    /// let myChord = try! Chord("Cmaj9/G")
    /// print(myChord.description)
    /// // This is a slash chord named Cmaj9/G over G, with root note C,
    /// // and component notes D, E, G, B, which are respectively major second,
    /// // major third, perfect fifth, major seventh above the root.
    /// ```
    /// If a chord is failed to create, it will print the error message in terminal.
    /// For full reference of available chords, go to <doc:Chords-Reference>
    public init(_ name: String) throws {
        // Split name into:
        var split = name.split(separator: "/", omittingEmptySubsequences: false).map(String.init)
        // [0]: custom name.
        var part1 = split.removeFirst()
        // (optional) [1]: slash
        let part2 = split.count == 1 ? split.removeFirst() : nil
        // If there are still elements in string, return nil.
        guard split.count == 0 else {
            throw CreationFailures.tooManySlashes
        }
        
        // Handling root name and quality.
        guard let root = part1.parseNote() else {
            throw CreationFailures.unrecognizedRoot
        }
 
        guard let quality = Quality(part1) else {
            throw CreationFailures.unrecognizedQuality
        }
        
        // Handling slash. Throw if slash is not a note or it's same with root.
        let slash: Note?
        if var part2 = part2 {
            slash = part2.parseNote()
            guard slash != nil else {
                throw CreationFailures.unrecognizedSlash
            }
            guard slash != root else {
                throw CreationFailures.slashOverlapsRoot
            }
        } else {
            slash = nil
        }
        
        // Initilize.
        self.init(root, quality, over: slash)
    }
}
