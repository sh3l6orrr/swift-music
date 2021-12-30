//
//  Chord.swift
//  MusicTheoryKit
//
//  Created by Jin Zhang on 12/13/21.
//

import StringHelper

/// A custom musical chord.
///
/// As someone familiar with music theory might expect, a custom chord has its component notes and a root note. The chord's quality is determined by these notes.
///
public struct Chord {
    // The root of this chord.
    let root: Note
    // Set of notes in the chord.
    let notes: Set<Note>
    // The note this chord is over.
    let slash: Note?
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
        let splitedName = name.split(separator: "/", omittingEmptySubsequences: false).map(String.init)
        guard
            (splitedName.count == 1
            || splitedName.count == 2)
            && !splitedName.contains("")
        else { return nil }
        
        var rootAndQuality = splitedName[0]
        var root = rootAndQuality[0]
        rootAndQuality.removeFirst()
        
        if rootAndQuality.count > 1 && rootAndQuality[0] == "b" {
            root += rootAndQuality[0]
            rootAndQuality.removeFirst()
        }
        
        let quality = Quality(rootAndQuality)
        let slash = splitedName.count == 2 ? splitedName[1] : nil
        
        guard let root = Note(root) else { return nil }
        guard let intervals = quality?.intervalsFormed else { return nil }
        if let slash = slash {
            guard Note(slash) != nil else { return nil }
        }
        let notes = intervals.map{ root + $0 }
        
        let doNotCreateSlash =
            slash == nil
            || Note(slash!)?.absolutePosition == root.absolutePosition
        self.notes = Set(notes)
        self.root = root
        self.slash = doNotCreateSlash ? nil : Note(slash!)!
    }
    /// Create a chord by specifying root, notes, and slash.
    public init(_ root: Note, _ notes: Set<Note>, over slash: Note? = nil) {
        self.root = root
        self.notes = notes
        self.slash = slash
    }
}

extension Chord {
    // Intervals in the chord.
    private var intervals: [Interval] {
        notes.compactMap { note in
            note == root || note == slash
            ? nil
            : note - self.root
        }
        .sorted()
    }
    // Quality of the chord.
    private var quality: Quality? {
        self.intervals.qualityFormed
    }
    public var isIn: (Scale) -> Bool {{ (_ scale: Scale) in
        self.notes.isSubset(of: scale.notes)
    }}
    /// The name of a chord.
    ///
    /// The following code generate a chord with name "Esus4"
    /// ```swift
    /// let root: Note = .E
    /// let notes: Set<Note> = Set([.E, .A, .B])
    /// let chord = Chord(root: root, notes: notes)?
    /// ```
    public var name: String {
        if let quality = self.quality?.description {
            return slash != nil && slash != root
            ? root.description + quality + "/" + slash!.description
            : root.description + quality
        } else {
            return "Not Identified"
        }
    }
    /// Describe the chord.
    public var description: String {
        if quality != nil {
            let ifSlashDescription = slash != nil && slash != root ? " slash" : ""
            let slashDescription = slash != nil && slash != root ? " over \(slash!.description)" : ""
            let notesDescription = intervals.map{ (root + $0).description }.joined(separator: ", ")
            let intervalsDescription = intervals.map{ $0.description }.joined(separator: ", ")
            return 
                "This is a\(ifSlashDescription) chord named \(name)\(slashDescription), "
                + "with root note \(root), "
                + "and component notes \(notesDescription), "
                + "which are respectively \(intervalsDescription) above the root."
        } else {
            return "This chord is not identified."
        }
    }
}
