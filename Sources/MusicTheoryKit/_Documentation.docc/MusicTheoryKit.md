# ``MusicTheoryKit``

MusicTheoryKit is a Swift framework that provides an easy-to-use API for most commonly used music terms.

## Overview

Create notes, assemble chords, do maths on notes, and many more to come.
```swift
let chord = Chord("Cmaj9/G")!
print(myChord.description)
// This is a slash chord named Cmaj9/G over G, with root note C, 
// and component notes D, E, G, B, which are respectively major second,
// major third, perfect fifth, major seventh above the root. 
```

![Logo](Logo.png)

## Topics

### Essentials

- <doc:Getting-Started>
- <doc:Chords-Reference>

### Foundamentals

- ``Note``
- ``Interval``
- ``Chord``

### Music Essentials

- ``MusicNote``
- ``Pause``
- ``Value``
- ``Beats``

### Creating Melody

- ``Playable``
- ``Melody``
- ``MelodyElement``
