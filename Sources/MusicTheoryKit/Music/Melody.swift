//
//  Melody.swift
//  
//
//  Created by Jin Zhang on 12/16/21.
//

/// Monophonic melody.
public struct Melody : Playable, Sequence {
    //------------------- Not Part of API --------------------------//
    private var elements: [MelodyElement]
}

public extension Melody {
    /// The leagth of the melody measured in beats.
    var length: Beats {
        var length = 0.0
        for element in elements { length += element.value.rawValue }
        return length
    }
}

public extension Melody {
    /// Create an empty melody with 0 beats.
    init() {
        self.elements = []
    }
    //------------------- Not Part of API --------------------------//
    private init(_ elements: [MelodyElement]) {
        self.elements = elements
    }
}

public extension Melody {
    /// Add an element, either a music note or pause to this melody.
    /// - Parameter element: A music note or a pause.
    func add(_ element: MelodyElement) -> Melody {
        Melody(elements + [element])
    }
    /// Get an iterator of this melody.
    /// - Returns: An iterator of this melody.
    func makeIterator() -> Iterator {
        Iterator(self)
    }

}

public extension Melody {
    /// Iterator of a melody.
    struct Iterator : IteratorProtocol {
        /// Create an iterator of a melody.
        /// - Parameter melody: The melody to be iterated.
        public init(_ melody: Melody) {
            self.melody = melody
        }
        /// Returns the next element in melody not iterated.
        /// - Returns: The next element in melody not iterated.
        public mutating func next() -> MelodyElement? {
            return self.melody.elements.count != 0 ? self.melody.elements.removeFirst() : nil
        }
        
        //------------------- Not Part of API --------------------------//
        private var melody: Melody
    }
}
