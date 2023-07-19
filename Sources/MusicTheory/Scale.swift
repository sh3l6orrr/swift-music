/// A scale.
///
/// Note that in this module, scale are specifically constructed from the seven modes.
/// If you are looking for other scales, go to Key.
public struct Scale {
    /// Tonic of the scale.
    public let tonic: Note
    /// Mode of the scale.
    public let mode: Mode
    /// Init a scale by specifying tonic and mode.
    public init(_ tonic: Note, _ mode: Mode) {
        self.tonic = tonic
        self.mode = mode
    }
    /// All notes in the scale starting from the tonic.
    public var notes: [Note] {
        self.mode.intervalsContained.map { self.tonic + $0 }
    }
    /// All triads in the scale ordered from I to VII.
    public var allTriads: [Chord] {
        self.notes.enumerated().map { index, note in
            let secondNote = self.notes[index + 2 > 6 ? index - 5 : index + 2]
            let thirdNote = self.notes[index + 4 > 6 ? index - 3 : index + 4]
            return Chord(note, notes: [secondNote, thirdNote])
        }
    }
    /// The triad at a degree.
    public func triad(degree: Int) -> Chord {
        return self.allTriads[degree - 1]
    }
}