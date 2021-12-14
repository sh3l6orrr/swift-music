# MusicTheoryKit

[![CI](https://github.com/sh3l6orrr/music-theory-kit/actions/workflows/CI.yml/badge.svg)](https://github.com/sh3l6orrr/music-theory-kit/actions/workflows/CI.yml)

## Introduction

MusicTheoryKit is a Swift framework that provides an easy-to-use API for most commonly used music terms.

Create notes, assemble chords, do maths on notes, and many more to come.
```swift
let chord = Chord(notes: Set<Note>([.C, .E, .G]), root: .C)
chord.description == "This is a chord with root note C, 
and notes major third, perfect fifth above it.""
```

## Installation

### Xcode Project

File - Add Packages - https://github.com/sh3l6orrr/music-theory-kit.git

### Swift Package Manager 

Inside Package.swift, add the followings:

```
    dependencies: [
        .package(url: "https://github.com/sh3l6orrr/music-theory-kit.git", from: "1.0.0")
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




