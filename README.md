# 🎼 swift-music

[![CI](https://github.com/sh3l6orrr/swift-music/actions/workflows/CI.yml/badge.svg)](https://github.com/sh3l6orrr/swift-music/actions/workflows/CI.yml)
[![Chords](https://img.shields.io/badge/Reference-Chord-blue)](https://github.com/sh3l6orrr/swift-music/blob/cd183a7740aca10a7b7488c89794b8a17b3c296d/Sources/MusicTheory/_Documentation.docc/Articles/Chords%20Reference.md)
[![DocMusicTheory](https://img.shields.io/badge/Documentation-MusicTheory-blue)](https://sh3l6orrr.github.io/swift-music/)
## Introduction

swift-music is a swift package that provides an easy-to-use API for music related developments.

Currently available module:
- MusicTheory: Notes, chords, scales.

### MusicTheory
```swift
import MusicTheory
```
#### Interval Arithmetic
```swift
Note.D - Note.E  // Interval.m7
```

#### Create a Chord
```swift
// Create with notes contained.
let Esus4 = Chord(.E, notes: [.E, .A, .B]) 

// Create with root and quality.
let Abm = Chord(.A_flat, .minorTriad)

```

#### Get triad in a scale
```swift
Scale(.B, .major).triad(degree: 6) // G#m
```

#### Other API
- Consonance and dissonance of interval, notes, or chord
- Checking if a note in a chord
- Create chord with both sharps and flats
- Support for 20+ chord qualities
- Support for both major and minor mode


## Installation

### Xcode Project

File - Add Packages - https://github.com/sh3l6orrr/swift-music.git

### Swift Package Manager 

Inside Package.swift, add the followings:

```
dependencies: [
    .package(url: "https://github.com/sh3l6orrr/swift-music.git", .upToNextMajor(from: "1.0.0"))
]
```
```
targets: [
    .target(
        name: "YourTarget",
        dependencies: [.product(name: "MusicTheory", package: "swift-music")]
    )
]
```

## Documentation

Click on the badge in the front of this README, or build in Xcode:

Product - Build Documentation 



