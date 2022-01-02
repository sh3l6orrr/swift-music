# ``MusicTheory``

MusicTheoryKit is a Swift framework that provides an easy-to-use API for most commonly used music terms.

## Overview

- Create a Chord
```swift
// Create with name need to be marked with the try! keyword.
let A7 = try! Chord("A7") 
```

- Get summary of a chord
```swift
A7.summary
// This is a chord named A7, with root note A, and component notes C#, E, G, which are 
// respectively major third, perfect fifth, minor seventh above the root. 
```
## Topics

### Essentials

- <doc:Getting-Started>
- <doc:Chords-Reference>
