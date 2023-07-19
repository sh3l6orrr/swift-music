/// A custom musical interval.
public enum Interval: Comparable, CustomStringConvertible {
    /// A musical interval that contains 0 or 12 semitones.
    case octave, m2, M2, m3, M3, p4, tritone, p5,
        m6, M6, m7, M7

    /// Create interval based on the number of semitones contained in it.
    public init(semitone: Int) {
        let semitone = abs(semitone % 12)
        self = semitoneToInterval[semitone]!
    }
    /// Semitones contained in this interval.
    public var semitones: Int {
        semitoneToInterval.first(where: { $0.value == self})!.key
    }
    /// String representation of the interval.
    public var description: String {
        nameToInterval.first(where: { $0.value == self })!.key
    }
}

