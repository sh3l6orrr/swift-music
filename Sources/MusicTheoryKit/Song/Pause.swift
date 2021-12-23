//
//  Pause.swift
//  
//
//  Created by Jin Zhang on 12/16/21.
//

/// A musical Pause.
public struct Pause {
    /// Value of this pause.
    public let value: Value
}

extension Pause : MelodyElement {
    /// Create a pause with specified value.
    /// - Parameter value: Value of this pause.
    public init(_ value: Value) {
        self.value = value
    }
}
