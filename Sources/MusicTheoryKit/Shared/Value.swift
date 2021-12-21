//
//  Value.swift
//  
//
//  Created by Jin Zhang on 12/16/21.
//

/// Representation of value of a note in a music context.
public enum Value : Double {
    /// A hunderd-twenty-eighth note.
    case _128 = 0.0078125
    /// A sixty-fourth note.
    case _64 = 0.015625
    /// A thirty-second note.
    case _32 = 0.03125
    /// A sixteenth note.
    case _16 = 0.0625
//    /// Half a quintuplet.
//    case _10 = 0.1
    /// An eighth note.
    case _8 = 0.125
    /// Half a triplet.
//    case _6 = 0.166666666666666
//    /// A quintuplet.
//    case _5 = 0.2
    /// A quarter note.
    case _4 = 0.25
//    /// A triplet.
//    case _3 = 0.333333333333333
    /// A half note.
    case _2 = 0.5
    /// A whole note.
    case _1 = 1
    /// A double whole note.
    case v_2 = 2
    /// A long.
    case v_4 = 4
    /// Adding two values.
}

public extension Value {
    static func + (_ lhs: Value, _ rhs: Value) -> Value? {
        return Value(rawValue: lhs.rawValue + rhs.rawValue)
    }
}

