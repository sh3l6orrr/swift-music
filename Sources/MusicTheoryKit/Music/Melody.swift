//
//  Melody.swift
//  
//
//  Created by Jin Zhang on 12/16/21.
//

/// Monophonic melody.
public struct Melody : Playable, Sequence {
    /// Create a melody with an array of melody elements.
    public init(_ elements: [MelodyElement] = []) {
        self.elements = elements
    }
    /// Elements in the melody.
    public var elements: [MelodyElement]
    /// The leagth of the melody measured in beats.
    public var beats: Double {
        var beats = 0.0
        for element in elements { beats += element.value.beats }
        return beats
    }
}

extension Melody {
    /// Add an element, either a music note or pause to this melody.
    /// - Parameter element: A music note or a pause.
    public func add(_ element: MelodyElement) -> Melody {
        Melody(elements + [element])
    }
    /// Get an iterator of this melody.
    /// - Returns: An iterator of this melody.
    public func makeIterator() -> Iterator {
        Iterator(self)
    }

}

/// Nested Type.
extension Melody {
    /// Iterator of a melody.
    public struct Iterator : IteratorProtocol {
        /// Create an iterator of a melody.
        /// - Parameter melody: The melody to be iterated.
        public init(_ melody: Melody) {
            self.melody = melody
        }
        private var melody: Melody
    }
}

extension Melody.Iterator {
    /// Returns the next element in melody not iterated.
    /// - Returns: The next element in melody not iterated.
    public mutating func next() -> MelodyElement? {
        return self.melody.elements.count != 0 ? self.melody.elements.removeFirst() : nil
    }
}
