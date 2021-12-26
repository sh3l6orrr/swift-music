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
chord.description

// This is a slash chord named Cmaj9/G over G, with root note C, and component 
// notes D, E, G, B, which are respectively major second, major third, perfect
// fifth, major seventh above the root. 
```

### Is this chord in my scale?
```swift
let chord = Chord("Cmaj9/G")!
let scale = Scale(.Cs, .major) // C♯ Major
chord.isIn(scale) // True
```

### Compose a Melody
```swift
let 🎶 = Melody()
    .add(MusicNote("E4", value: ._2))
    .add(MusicNote("D4", value: ._2))
    .add(Pause(._2))
    .add(MusicNote("E4", value: ._2))
    .add(MusicNote("C4", value: ._1))

🎶.length // 3 Beats
🎶.visualization // To be implemented
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
    .package(url: "https://github.com/sh3l6orrr/music-theory-kit.git", .upToNextMajor(from: "0.2.0"))
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




