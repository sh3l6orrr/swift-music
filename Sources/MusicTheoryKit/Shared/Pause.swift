//
//  Pause.swift
//  
//
//  Created by Jin Zhang on 12/16/21.
//

/// A musical Pause.
public struct Pause : MelodyElement {
    /// Value of this pause.
    public let value: Value
}

public extension Pause {
    /// Create a pause with specified value.
    /// - Parameter value: Value of this pause.
    init(_ value: Value) {
        self.value = value
    }
}
