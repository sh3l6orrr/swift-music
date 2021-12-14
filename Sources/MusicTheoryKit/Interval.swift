//
//  Interval.swift
//  MusicTheoryKit
//
//  Created by Jin Zhang on 12/12/21.
//

/// A custom musical interval.
public enum Interval: Comparable {
    /// Musical interval.
    case octave, m2, M2, m3, M3, p4, tritone, p5, m6, M6, m7, M7
    /// Create interval based on the number of semitones contained in it.
    public init?(semitone: Int) {
        guard semitone >= 0 else {
            return nil
        }
        guard let interval = Interval.intToInterval[semitone % 12] else {
            return nil
        }
        self = interval
    }
    /// Whole name of the interval.
    public var wholeName: String {
        Interval.intervalToWholeName[self]!
    }
    
    //------------------- Not Part of API --------------------------//
    static let IntervalToInt: [Interval : Int] = [
        octave: 0, m2: 1, M2: 2, m3: 3, M3: 4, p4: 5,
        tritone: 6, p5: 7, m6: 8, M6: 9, m7: 10, M7: 11
    ]
    
    var num: Int {
        Interval.IntervalToInt[self]!
    }
    
    private static let intToInterval: [Int : Interval] = [
        0: octave, 1: m2, 2: M2, 3: m3, 4: M3, 5: p4,
        6: tritone, 7: p5, 8: m6, 9: M6, 10: m7, 11: M7
    ]
    
    private static let intervalToWholeName: [Interval : String] = [
        octave: "octave", m2: "minor second", M2: "major second",
        m3: "minor third", M3: "major third", p4: "perfect fourth",
        tritone: "tritone", p5: "perfect fifth", m6: "minor sixth",
        M6: "major sixth", m7: "minor seventh", M7: "major seventh"
    ]
}


