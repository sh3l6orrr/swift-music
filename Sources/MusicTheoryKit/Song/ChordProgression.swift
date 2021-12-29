//
//  ChordProgression.swift
//  
//
//  Created by Jin Zhang on 12/16/21.
//

/// Element in a chord progression.
public protocol ChordProgressionElement {
    /// Value of such an element.
    var value: Value { get }
}

public typealias ChordProgression = [ChordProgressionElement]

extension ChordProgression {
    /// The leagth of chord progression measured in beats.
    public var beats: Double {
        self.map { element in element.value.beats }.reduce(0, +)
    }
    /// Add an element, either a music note or pause to this chord progression.
    /// - Parameter element: A music chord or a pause.
    public func add(_ element: ChordProgressionElement) -> ChordProgression {
        ChordProgression(self + [element])
    }
}
