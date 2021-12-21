//
//  Interval.swift
//  MusicTheoryKit
//
//  Created by Jin Zhang on 12/12/21.
//

/// A custom musical interval.
public enum Interval : Comparable, CaseIterable {
    /// Create interval based on the number of semitones contained in it.
    public init?(semitone: Int) {
        guard semitone >= 0 else {
            return nil
        }
        guard let interval = intToInterval[semitone % 12] else {
            return nil
        }
        self = interval
    }
    /// Musical interval.
    case octave, m2, M2, m3, M3, p4, tritone, p5, m6, M6, m7, M7
    /// Whole name of the interval.
    public var wholeName: String {
        intervalToWholeName[self]!
    }
}
