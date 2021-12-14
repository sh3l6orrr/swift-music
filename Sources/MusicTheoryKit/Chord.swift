//
//  Chord.swift
//  MusicTheoryKit
//
//  Created by Jin Zhang on 12/13/21.
//

/// A custom musical chord.
///
/// As someone familiar with music theory might expect, a custom chord has its component notes and a root note. The chord's quality is determined by these notes.
public struct Chord {
    /// Create a chord based on its component notes and the root note.
    public init?(notes: Set<Note>, root: Note) {
        
        self.root = root
        self.notes = notes
        
        var intervals = [Interval]()
        for note in notes {
            if (note == root) {
                continue
            }
            intervals.append(note - root)
        }
        intervals.sort()
        guard let quality = Chord.semitonesToQuality[intervals] else {
            return nil
        }
        self.intervals = intervals
        self.quality = quality
    }
    /// The name of a chord.
    ///
    /// The following code generate a chord with name "Esus4"
    /// ```swift
    /// let root = Note.E
    /// let notes = Set<Note>([Note.E, Note.A, Note.B])
    /// let chord = Chord(notes: notes, root: root)?
    /// ```
    public var name: String {
        root.rawValue + quality
    }
    /// Describe the chord.
    public var description: String {
        "This is a chord named \(name), with root note \(root), and notes" +
        intervals.map{ $0.wholeName }.joined(separator: ",") +
        "above it."
    }
    
    //------------------- Not Part of API --------------------------//
    private let notes: Set<Note>
    
    private let root: Note
    
    private let intervals: [Interval]
    
    private let quality: String
    
    private static let semitonesToQuality: [[Interval] : String] = [
        
        [Interval.p5] : "5",
            
        [Interval.M2, Interval.p5]: "sus2",
        [Interval.m3, Interval.tritone]: "dim",
        [Interval.m3, Interval.p5]: "m",
        [Interval.M3, Interval.p5]: "",
        [Interval.M3, Interval.m6]: "aug",
        [Interval.p4, Interval.p5]: "sus4",
        
        [Interval.M2, Interval.M3, Interval.p5]: "add9",
        [Interval.m3, Interval.tritone, Interval.M6]: "dim7",
        [Interval.m3, Interval.tritone, Interval.m7]: "m7b5",
        [Interval.m3, Interval.p5, Interval.M6]: "m6",
        [Interval.m3, Interval.p5, Interval.m7]: "m7",
//        [3, 7, 11]: "mM",
//        [4, 5, 7]: "add11",
//        [4, 6, 10]: "7-5",
        [Interval.M3, Interval.p5, Interval.M6]: "6",
        [Interval.M3, Interval.p5, Interval.m7]: "7",
        [Interval.M3, Interval.p5, Interval.M7]: "maj7",
//        [4, 8, 10]: "aug7",
        [Interval.p4, Interval.p5, Interval.m7]: "7sus4",
            
//        [2, 3, 7, 10]: "m9",
//        [2, 4, 7, 10]: "9",
//        [2, 4, 7, 11]: "maj9",
//
//        [2, 3, 5, 7, 10]: "m11",
//        [2, 4, 5, 7, 10]: "11",
//
//        [2, 3, 5, 7, 9, 10]: "m13",
//        [2, 4, 5, 7, 9, 10]: "13"
    ]
}
