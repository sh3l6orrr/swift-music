//
//  Melody.swift
//  
//
//  Created by Jin Zhang on 12/16/21.
//

/// Element in a monophonic melody.
public protocol MelodyElement {
    /// Value of such an element.
    var value: Value { get }
}

public typealias Melody = [MelodyElement]

extension Melody {
    /// The leagth of the melody measured in beats.
    public var beats: Double {
        self.map { element in element.value.beats }.reduce(0, +)
    }
    /// Add an element, either a music note or pause to this melody.
    /// - Parameter element: A music note or a pause.
    public func add(_ element: MelodyElement) -> Melody {
        Melody(self + [element])
    }
}
