# MusicTheoryKit

[![CI](https://github.com/sh3l6orrr/music-theory-kit/actions/workflows/CI.yml/badge.svg)](https://github.com/sh3l6orrr/music-theory-kit/actions/workflows/CI.yml)

## Introduction

MusicTheoryKit is a Swift framework that provides an easy-to-use API for most commonly used music terms.

Create notes, assemble chords, do maths on notes, and many more to come.
```swift
let chord = Chord(root: .F, notes: Set([.F, .G, .C]), slash: .Bb)
print(chord.description) 
\\ This is a slash chord named Fsus2/Bb over Bb, with root note F, and component notes G, C, 
\\ which are respectively major second, perfect fifth above the root. 
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




