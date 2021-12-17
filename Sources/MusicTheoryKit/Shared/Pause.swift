//
//  Pause.swift
//  
//
//  Created by Jin Zhang on 12/16/21.
//

/// A musical Pause.
public struct Pause: MelodyElement {
    /// Create a pause with specified value.
    public init(_ value: Value) {
        self.value = value
    }
    /// Value of the pause.
    public let value: Value
}
