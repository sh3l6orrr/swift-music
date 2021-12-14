# ``MusicTheoryKit``

MusicTheoryKit is a Swift framework that provides an easy-to-use API for most commonly used music terms.

## Overview

Create notes, assemble chords, do maths on notes, and many more to come.
```swift
let chord = Chord(notes: Set<Note>([.C, .E, .G]), root: .C)
chord.description == "This is a chord with root note C, 
and notes major third, perfect fifth above it.""
```

![Logo](Logo.png)

## Topics

### Essentials

- <doc:Getting-Started>
- ``Note``
- ``Chord``

### Note Arithmetics

- ``Interval``
- ``Note/-(_:_:)-779fi``
