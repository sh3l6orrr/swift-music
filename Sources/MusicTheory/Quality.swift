/// Quality of a chord.
public enum Quality: CaseIterable, LosslessStringConvertible {
    case power, suspended2ndTriad, diminishedTriad, minorTriad, majorTriad, augmentedTriad,
        suspended4thTriad, diminishedSeventh, halfDiminishedSeventh, dominantSeventhWithFlat5th,
        minorSixth, majorSixth, minorMajorSeventh, augmentedSeventh, dominantSeventhWithSuspended4th,
        minorTriadAdded9th, majorTriadAdded9th, minorTriadAdded11th, majorTriadAdded11th,
        minorSeventh, dominantSeventh, majorSeventh, minorNinth, dominantNinth, majorNinth
    var intervalsFormed: [Interval] {
        qualityToIntervals[self]!
    }
    /// Create a quality from string.
    public init?(_ description: String) {
        if let quality = nameToQuality[description] { self = quality } 
        else { return nil }
    }
    /// Name of a quality.
    public var description: String {
        nameToQuality.first(where: { $0.value == self } )!.key
    }
}

extension Array where Element == Interval {
    /// Get quality of an array of Intervals.
    var qualityFormed: Quality? {
        if let found = qualityToIntervals.first(where: { $0.value == self }) {
            return found.key
        } else { return nil }
    }
}
