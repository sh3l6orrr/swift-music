//
//  Interval.swift
//  MusicTheoryKit
//
//  Created by Jin Zhang on 12/12/21.
//

/// A custom musical interval.
public enum Interval : Comparable, CaseIterable {
    /// Musical interval.
    case octave, m2, M2, m3, M3, p4, tritone, p5, m6, M6, m7, M7
}

public extension Interval {
    /// Whole name of the interval.
    var wholeName: String {
        intervalToWholeName[self]!
    }
}
public extension Interval {
    /// Create interval based on the number of semitones contained in it.
    init?(semitone: Int) {
        guard semitone >= 0 else {
            return nil
        }
        guard let interval = intToInterval[semitone % 12] else {
            return nil
        }
        self = interval
    }
}

