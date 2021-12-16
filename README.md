# 🎼  MusicTheoryKit

[![CI](https://github.com/sh3l6orrr/music-theory-kit/actions/workflows/CI.yml/badge.svg)](https://github.com/sh3l6orrr/music-theory-kit/actions/workflows/CI.yml)

## Introduction

MusicTheoryKit is a Swift framework that provides an easy-to-use API for most commonly used music terms.

Create notes, assemble chords, do maths on notes, and many more to come.
```swift
import MusicTheoryKit

let chord = Chord("Cmaj9/G")!
print(myChord.description)

// This is a slash chord named Cmaj9/G over G, with root note C, and component notes D, E, G, B, 
// which are respectively major second, major third, perfect fifth, major seventh above the root. 
```
```swift
import MusicTheoryKit

Note.D - Note.E  // Interval.m7
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




