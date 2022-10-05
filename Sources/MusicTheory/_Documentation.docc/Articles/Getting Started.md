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
let Esus4 = Chord(.E, notes: [.E, .A, .B]) 

// Create with root and quality.
let Abm = Chord(.A_flat, .minorTriad)
```

- Get triad in a scale
```swift
Scale(.B, .major).triad(degree: 6) // G#m
```

#### Other API
- Consonance and dissonance of interval, notes, or chord
- Checking if a note in a chord
- Support for 20+ chord qualities
- Support for 10+ modes (To be implemented)
