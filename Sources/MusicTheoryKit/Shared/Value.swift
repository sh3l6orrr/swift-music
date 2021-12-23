//
//  Value.swift
//  
//
//  Created by Jin Zhang on 12/16/21.
//

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
//    /// Half a quintuplet.
//    case _10 = 0.1
    /// An eighth note.
    case _8
    /// Half a triplet.
//    case _6 = 0.166666666666666
//    /// A quintuplet.
//    case _5 = 0.2
    /// A quarter note.
    case _4
//    /// A triplet.
//    case _3 = 0.333333333333333
    /// A half note.
    case _2
    /// A whole note.
    case _1
    /// A double whole note.
    case v_2
    /// A long.
    case v_4
    /// Beats correspondence of the value.
    public var beats: Double {
        valueToBeats[self]!
    }
}

extension Value {
    private init(_ beats: Double) throws {
        guard let value = beatsToValue[beats] else { throw ValueError.creationFailure }
        self = value
    }
}

extension Value {
    /// Adding two values.
    public static func + (_ lhs: Value, _ rhs: Value) throws -> Value {
        try Value(lhs.beats + rhs.beats)
    }
}

fileprivate enum ValueError: Error {
    case creationFailure
}
