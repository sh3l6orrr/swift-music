//
//  Value.swift
//  
//
//  Created by Jin Zhang on 12/16/21.
//

import MusicTheory

/// Representation of value of a note in a music context.
public enum Value {
    /// A hunderd-twenty-eighth note.
    case _128
    /// A sixty-fourth note.
    case _64
    /// A thirty-second note.
    case _32
    /// A sixteenth note.
    case _16
    /// An eighth note.
    case _8
    /// A quarter note.
    case _4
    /// A half note.
    case _2
    /// A whole note.
    case _1
    /// A double whole note.
    case v_2
    /// A long.
    case v_4
    // This is for the purpose of converting beats and value.
    private init?(_ beats: Double) {
        guard let value = beatsToValue[beats] else { return nil }
        self = value
    }
}

extension Value {
    /// Beats correspondence of the value.
    public var beats: Double {
        valueToBeats[self]!
    }
    /// Adding two values.
    public static func + (_ lhs: Value, _ rhs: Value) -> Value? {
        Value(lhs.beats + rhs.beats)
    }
}

let valueToBeats: [Value : Double] = [
    ._128:  0.0078125,
    ._64:  0.015625,
    ._32:  0.03125,
    ._16:  0.0625,
    ._8:  0.125,
    ._4:  0.25,
    ._2:  0.5,
    ._1:  1,
    .v_2:  2,
    .v_4:  4
]

let beatsToValue: [Double: Value] = [
    0.0078125: ._128,
    0.015625: ._64,
    0.03125: ._32,
    0.0625: ._16,
    0.125: ._8,
    0.25: ._4,
    0.5: ._2,
    1: ._1,
    2: .v_2,
    4: .v_4
]
