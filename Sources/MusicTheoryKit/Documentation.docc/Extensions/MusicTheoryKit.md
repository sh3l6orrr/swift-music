# ``MusicTheoryKit``

MusicTheoryKit is a Swift framework that provides an easy-to-use API for most commonly used music terms.

## Overview

Create notes, assemble chords, do maths on notes, and many more to come.
```swift
let chord = Chord(root: .F, notes: Set([.F, .G, .C]), slash: .Bb)
print(chord.description) 
\\ This is a slash chord named Fsus2/Bb over Bb, with root note F, and component notes G, C, 
\\ which are respectively major second, perfect fifth above the root. 
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
