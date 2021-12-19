//
//  ChordProgression.swift
//  
//
//  Created by Jin Zhang on 12/19/21.
//

/// A ChordProgression.
public struct ChordProgression : Playable, Sequence {
    /// Create an empty chordProgression with 0 beats.
    public init() {
        self.elements = []
    }
    /// The leagth of the ChordProgression measured in beats.
    public var length: Beats {
        var length = 0.0
        for element in elements { length += element.value.rawValue }
        return length
    }
    /// Add an element, either a music note or pause to this ChordProgression.
    /// - Parameter element: A music note or a pause.
    public mutating func add(_ element: ChordProgressionElement) {
        elements.append(element)
    }
    /// Get an iterator of this ChordProgression.
    /// - Returns: An iterator of this ChordProgression.
    public func makeIterator() -> Iterator {
        return Iterator(self)
    }
    /// Iterator of a ChordProgression.
    public struct Iterator : IteratorProtocol {
        /// Create an iterator of a ChordProgression.
        /// - Parameter ChordProgression: The ChordProgression to be iterated.
        public init(_ chordProgression: ChordProgression) {
            self.chordProgression = chordProgression
        }
        /// Returns the next element in ChordProgression not iterated.
        /// - Returns: The next element in ChordProgression not iterated.
        public mutating func next() -> ChordProgressionElement? {
            return self.chordProgression.elements.count != 0 ? self.chordProgression.elements.removeFirst() : nil
        }
        
        //------------------- Not Part of API --------------------------//
        private var chordProgression: ChordProgression
    }
    
    //------------------- Not Part of API --------------------------//
    private var elements: [ChordProgressionElement]
}
