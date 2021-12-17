# 🎼 MusicTheoryKit

[![CI](https://github.com/sh3l6orrr/music-theory-kit/actions/workflows/CI.yml/badge.svg)](https://github.com/sh3l6orrr/music-theory-kit/actions/workflows/CI.yml)

## Introduction

MusicTheoryKit is a Swift framework that provides an easy-to-use API for most commonly used music terms.

```swift
import MusicTheoryKit
```
### Interval Arithmetic
```swift
Note.D - Note.E  // Interval.m7
```

### Create a Chord
```swift
let chord = Chord("Cmaj9/G")!
myChord.description

// This is a slash chord named Cmaj9/G over G, with root note C, and component 
// notes D, E, G, B, which are respectively major second, major third, perfect
// fifth, major seventh above the root. 
```

### Compose a Melody
```swift
var melody = Melody()
melody.add(MusicNote(.E), octave: 4, value: ._2)
melody.add(MusicNote(.D), octave: 4, value: ._2)
melody.add(Pause(._2))
melody.add(MusicNote(.E), octave: 4, value: ._2)
melody.add(MusicNote(.C), octave: 4, value: ._1)

melody.length // 3 Beats
melody.visualization // To be implemented
```

### Compose a Chord Progression
```swift
// To be implemented
```

### Compose a Piece of Music
```swift
// To be implemented
```

### Analyze Music
```swift
// To be implemented
```

### Customization
```swift
extension MusicNote {
    // To be implemented
}
```

## Installation

### Xcode Project

File - Add Packages - https://github.com/sh3l6orrr/music-theory-kit.git

### Swift Package Manager 

Inside Package.swift, add the followings:

```
dependencies: [
    .package(url: "https://github.com/sh3l6orrr/music-theory-kit.git", .upToNextMajor(from: "1.0.0"))
]
```
```
targets: [
    .target(
        name: "YourTarget",
        dependencies: [
            .product(name: "MusicTheoryKit", package: "music-theory-kit")
        ]
    )
]
```

## Documentation

Documentation can be built in Xcode by 

Product - Build Documentation 

## License

This project is published under the Apache License 2.0.




