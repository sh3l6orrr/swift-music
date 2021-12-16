//
//  Chord.swift
//  MusicTheoryKit
//
//  Created by Jin Zhang on 12/13/21.
//

/// A custom musical chord.
///
/// As someone familiar with music theory might expect, a custom chord has its component notes and a root note. The chord's quality is determined by these notes.
/// Create a chord by using it's name directly is the most conveinient way!
/// ```swift
/// let myChord = Chord("Cmaj9/G")!
/// print(myChord.description)
/// // This is a slash chord named Cmaj9/G over G, with root note C,
/// // and component notes D, E, G, B, which are respectively major second,
/// // major third, perfect fifth, major seventh above the root.
/// ```
public struct Chord {
    /// Create a chord based on its component notes and the root note. Optionally, specify a slash root if it's a slash chord.
    ///
    /// ```swift
    /// let chord = Chord(root: .F, notes: Set([.F, .G, .C]), slash: .Bb)
    /// ```
    /// For full reference of available chords, go to <doc:Chords-Reference>
    public init?(root: Note, notes: Set<Note>, slash: Note? = nil) {
        var intervals = [Interval]()
        for note in notes {
            if (note == root || note == slash) { continue }
            intervals.append(note - root)
        }
        intervals.sort()
        guard let quality = Chord.semitonesToQuality[intervals] else { return nil }
        
        self.root = root
        self.notes = notes
        if slash == root { self.slash = nil } else { self.slash = slash }
        self.intervals = intervals
        self.quality = quality
    }
    /// Create a chord directly from it's name.
    ///
    /// ```swift
    /// let chord = Chord("Cmaj9/G")
    /// ```
    /// For full reference of available chords, go to <doc:Chords-Reference>
    public init?(_ name: String) {
        let splitedName = name.split(separator: "/", omittingEmptySubsequences: false)
        guard splitedName.count == 1 || splitedName.count == 2 else { return nil }
        guard !splitedName.contains("") else { return nil }
        var rootAndQuality = String(splitedName[splitedName.startIndex])
        var root = String(rootAndQuality.remove(at: rootAndQuality.startIndex))
        if rootAndQuality.count > 1 && rootAndQuality[rootAndQuality.startIndex] == "b" {
            root += String(rootAndQuality[rootAndQuality.startIndex])
            rootAndQuality.remove(at: rootAndQuality.startIndex)
        }
        let quality = rootAndQuality
        let slash = splitedName.count == 2 ? String(splitedName[splitedName.index(splitedName.startIndex, offsetBy: 1)]) : nil
        self.init(root, quality, over: slash)
    }
    /// The name of a chord.
    ///
    /// The following code generate a chord with name "Esus4"
    /// ```swift
    /// let root: Note = .E
    /// let notes: Set<Note> = Set([.E, .A, .B])
    /// let chord = Chord(root: root, notes: notes)?
    /// ```
    public var name: String {
        if let slash = slash {
            return root.rawValue + quality + "/" + slash.rawValue
        } else {
            return root.rawValue + quality
        }
    }
    /// Describe the chord.
    public var description: String {
        let ifSlashDescription = slash != nil ? " slash" : ""
        let slashDescription = slash != nil ? " over \(slash!.rawValue)" : ""
        let notesDescription = intervals.map{ (root + $0).rawValue }.joined(separator: ", ")
        let intervalsDescription = intervals.map{ $0.wholeName }.joined(separator: ", ")
        
        return "This is a\(ifSlashDescription) chord named \(name)\(slashDescription), with root note \(root), and component notes \(notesDescription), which are respectively \(intervalsDescription) above the root."
    }
    
    //------------------- Not Part of API --------------------------//
    private let root: Note
    private let notes: Set<Note>
    private let slash: Note?
    private let intervals: [Interval]
    private let quality: String
    
    private init?(_ root: String, _ quality: String, over slash: String? = nil) {
        
        guard let root = Note(rawValue: root) else { return nil }
        guard let intervals = Chord.semitonesToQuality.first(where: { $1 == quality })?.key else { return nil }
        if let slash = slash { guard Note(rawValue: slash) != nil else { return nil } }
        let notes = intervals.map{ root + $0 }
        let doNotCreateSlash = slash == nil || Note(rawValue: slash!) == root
        
        self.notes = Set(notes)
        self.root = root
        self.slash = doNotCreateSlash ? nil : Note(rawValue: slash!)!
        self.intervals = intervals
        self.quality = quality
    }
    
    private static let semitonesToQuality: [[Interval] : String] = [
        [Interval.p5] : "5",
        [Interval.M2, Interval.p5]: "sus2",
        [Interval.m3, Interval.tritone]: "dim",
        [Interval.m3, Interval.p5]: "m",
        [Interval.M3, Interval.p5]: "",
        [Interval.M3, Interval.m6]: "aug",
        [Interval.p4, Interval.p5]: "sus4",
        
        [Interval.m3, Interval.tritone, Interval.M6]: "dim7",
        [Interval.m3, Interval.tritone, Interval.m7]: "m7b5",
        [Interval.M3, Interval.tritone, Interval.m7]: "7-5",
        
        [Interval.m3, Interval.p5, Interval.M6]: "m6",
        [Interval.M3, Interval.p5, Interval.M6]: "6",
        
        [Interval.m3, Interval.p5, Interval.M7]: "mMaj7",
        [Interval.M3, Interval.m6, Interval.m7]: "aug7",
        [Interval.p4, Interval.p5, Interval.m7]: "7sus4",
        
        [Interval.M2, Interval.M3, Interval.p5]: "add9",
        [Interval.M3, Interval.p4, Interval.p5]: "add11",
        
        [Interval.m3, Interval.p5, Interval.m7]: "m7",
        [Interval.M3, Interval.p5, Interval.m7]: "7",
        [Interval.M3, Interval.p5, Interval.M7]: "maj7",
        
        [Interval.M2, Interval.m3, Interval.p5, Interval.m7]: "m9",
        [Interval.M2, Interval.M3, Interval.p5, Interval.m7]: "9",
        [Interval.M2, Interval.M3, Interval.p5, Interval.M7]: "maj9",
        
        [Interval.M2, Interval.m3, Interval.p4, Interval.p5, Interval.m7]: "m11",
        [Interval.M2, Interval.M3, Interval.p4, Interval.p5, Interval.m7]: "11",
        [Interval.M2, Interval.M3, Interval.p4, Interval.p5, Interval.M7]: "maj11",
        
        [Interval.M2, Interval.m3, Interval.p4, Interval.p5, Interval.M6, Interval.m7]: "m13",
        [Interval.M2, Interval.M3, Interval.p4, Interval.p5, Interval.M6, Interval.m7]: "13",
        [Interval.M2, Interval.M3, Interval.p4, Interval.p5, Interval.M6, Interval.M7]: "maj13",
    ]
}
