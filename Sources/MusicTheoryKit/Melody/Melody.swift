//
//  Melody.swift
//  
//
//  Created by Jin Zhang on 12/16/21.
//

/// Monophonic melody.
public class Melody : Playable, Collection {
    /// Create an empty melody with 0 beats.
    public init() {
        self.elements = []
    }
    /// Add an element, either a music note or pause to this melody.
    public func add(_ element: MelodyElement) {
        elements.append(element)
    }
    /// The leagth of the melody measured in beats.
    public var length: Beats {
        var length = 0.0
        for element in elements { length += element.value.rawValue }
        return length
    }
    
    //------------------- Not Part of API --------------------------//
    private var elements: [MelodyElement]
    
}
