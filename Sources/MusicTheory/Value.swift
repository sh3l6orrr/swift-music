//
//  Value.swift
//  
//
//  Created by Jin Zhang on 12/16/21.
//

/// Representation of value of a note in a music context.
public enum Value {
    /// A sixty-fourth note.
    case sixtyfourth
    /// A thirty-second note.
    case thirtysecond
    /// A sixteenth note.
    case sixteenth
    /// An eighth note.
    case eighth
    /// A quarter note.
    case quarter
    /// A half note.
    case half
    /// A whole note.
    case whole
    /// A double whole note.
    case double
    /// A long.
    case long
}

extension Value {
    // This is for the purpose of converting beats and value.
    init?(_ beats: Double) {
        switch beats {
        case 0.15625  : self = .sixtyfourth
        case 0.03125  : self = .thirtysecond
        case 0.0625   : self = .sixteenth
        case 0.125    : self = .eighth
        case 0.25     : self = .quarter
        case 0.5      : self = .half
        case 1.0      : self = .whole
        case 2.0      : self = .double
        case 4.0      : self = .long
        default       : return nil
        }
    }
    /// Beats correspondence of the value.
    public var beats: Double {
        switch self {
        case .sixtyfourth   : return 0.15625
        case .thirtysecond  : return 0.03125
        case .sixteenth     : return 0.0625
        case .eighth        : return 0.125
        case .quarter       : return 0.25
        case .half          : return 0.5
        case .whole         : return 1.0
        case .double        : return 2.0
        case .long          : return 4.0
        }
    }
    /// Adding two values.
    public static func + (_ lhs: Self, _ rhs: Self) -> Self? {
        .init(lhs.beats + rhs.beats)
    }
}
