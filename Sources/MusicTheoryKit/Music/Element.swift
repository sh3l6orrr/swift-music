//
//  MelodyElement.swift
//  
//
//  Created by Jin Zhang on 12/16/21.
//

/// Element in a monophonic melody.
public protocol MelodyElement {
    //------------------- Not Part of API --------------------------//
    var value: Value { get }
}

/// Element in a chord progression.
public protocol ChordProgressionElement {
    //------------------- Not Part of API --------------------------//
    var value: Value { get }
}
