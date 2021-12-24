//
//  Melody.swift
//  
//
//  Created by Jin Zhang on 12/16/21.
//

/// Monophonic melody.
public struct Melody {
    // Elements in the melody.
    var elements: [MelodyElement]
    /// Create a melody with an array of melody elements.
    public init() {
        self.elements = []
    }
}

extension Melody {
    /// The leagth of the melody measured in beats.
    public var beats: Double {
        elements.map { element in element.value.beats }.reduce(0, +)
    }
    /// Add an element, either a music note or pause to this melody.
    /// - Parameter element: A music note or a pause.
    public func add(_ element: MelodyElement) -> Melody {
        Melody(elements: elements + [element])
    }
}

extension Melody : Sequence {
    /// Get an iterator of this melody.
    /// - Returns: An iterator of this melody.
    public func makeIterator() -> Iterator {
        Iterator(self)
    }
    /// Iterator of a melody.
    public struct Iterator : IteratorProtocol {
        /// Create an iterator of a melody.
        /// - Parameter melody: The melody to be iterated.
        public init(_ melody: Melody) {
            self.melody = melody
        }
        /// Returns the next element in melody not iterated.
        /// - Returns: The next element in melody not iterated.
        public mutating func next() -> MelodyElement? {
            self.melody.elements.count != 0
                ? self.melody.elements.removeFirst()
                : nil
        }
        private var melody: Melody
    }
}
