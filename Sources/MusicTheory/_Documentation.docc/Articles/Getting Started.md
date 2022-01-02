# Getting Started

Get stared with MusicTheory.

## Overview

- Interval Arithmetic
```swift
Note.D - Note.E  // Interval.m7
```

- Create a Chord
```swift
// Create with notes contained.
let Esus4 = Chord(root: .E, [.E, .A, .B]) 

// Create with root and quality.
let Abm = Chord(root: .A_flat, quality: .minorTriad)

// Create with name need to be marked with the try! keyword.
let A7 = try! Chord("A7") 
```

- Get summary of a chord
```swift
A7.summary
// This is a chord named A7, with root note A, and component notes C#, E, G, which are 
// respectively major third, perfect fifth, minor seventh above the root. 
```

- Is this chord in my scale?
```swift
try! Chord("Dbm").isIn(scale: .init(.B, .major)) // true
```

#### Other API
- Consonance and dissonance of interval, notes, or chord
- Checking if a note in a chord
- Create chord with both sharps and flats
- Create slash chords
- Support for 20+ chord qualities
- Support for 10+ modes (To be implemented)
