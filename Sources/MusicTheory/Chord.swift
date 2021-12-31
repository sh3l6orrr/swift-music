//
//  Chord.swift
//  MusicTheoryKit
//
//  Created by Jin Zhang on 12/13/21.
//

import StringHelper

/// A custom musical chord.
///
/// As someone familiar with music theory might expect, a custom chord has its
/// component notes and a root note. The chord's quality is determined by these notes.
public struct Chord {
    // The root of this chord.
    let root: Note
    // Set of notes in the chord.
    let notes: Set<Note>
    // The note this chord is over.
    let slash: Note?
}

extension Chord {
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
    /// let root: Note = .E
    /// let notes: Set<Note> = Set([.E, .A, .B])
    /// let chord = Chord(root: root, notes: notes)?
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
    public init(_ root: Note, _ notes: Set<Note>, over slash: Note? = nil) {
        self.root = root
        self.notes = notes
        self.slash = root == slash ? nil : slash
    }
    /// Create a chord directly from it's name.
    ///
    /// Create a chord by using it's name directly is the most conveinient way!
    /// ```swift
    /// let myChord = Chord("Cmaj9/G")!
    /// print(myChord.description)
    /// // This is a slash chord named Cmaj9/G over G, with root note C,
    /// // and component notes D, E, G, B, which are respectively major second,
    /// // major third, perfect fifth, major seventh above the root.
    /// ```
    /// For full reference of available chords, go to <doc:Chords-Reference>
    public init?(_ name: String) {
        // Split name into [0]: custom name, [1]: slash
        // Return nil if the format is wrong.
        let splitedName = name.split(separator: "/", omittingEmptySubsequences: false).map(String.init)
        guard
            (splitedName.count == 1
             || splitedName.count == 2)
                && !splitedName.contains("")
        else { return nil }
        
        // Handling root name.
        var rootAndQuality = splitedName[0]
        var root = rootAndQuality[0]
        rootAndQuality.removeFirst()
        if rootAndQuality.count >= 1 {
            switch rootAndQuality[0] {
            case "b": root += String(rootAndQuality.removeFirst())
            case "#": root += String(rootAndQuality.removeFirst())
            default: break
            }
        }
        guard let root = Note(root) else { return nil }
        
        // Handling quality.
        let quality = Quality(rootAndQuality)
        guard let intervals = quality?.intervalsFormed else { return nil }
        let notes = Set(intervals.map{ root + $0 })
        
        // Handling slash. Return nil if slash is not a note or it's same with root.
        let slashStr = splitedName.count == 2 ? splitedName[1] : nil
        if let slashStr = slashStr {
            guard
                Note(slashStr) != nil
                && Note(slashStr) != root
            else { return nil }
        }
        let slash = slashStr == nil ? nil : Note(slashStr!)!
        
        // Initilize.
        self.init(root, notes, over: slash)
    }
}
