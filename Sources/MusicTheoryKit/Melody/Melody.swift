//
//  Melody.swift
//  
//
//  Created by Jin Zhang on 12/16/21.
//

/// Monophonic melody.
public class Melody: Playable {
    /// Create an empty melody with 0 beats.
    public init() {
        self.content = []
    }
    /// Add an element, either a music note or pause to this melody.
    public func add(_ element: MelodyElement) {
        content.append(element)
    }
    /// The leagth of the melody measured in beats.
    public var length: Beats {
        var length = 0.0
        for element in content { length += element.value.rawValue }
        return length
    }
    /// What does this melody contain?
    public var elements: [MelodyElement] { content }
    //------------------- Not Part of API --------------------------//
    var content: [MelodyElement]
}
