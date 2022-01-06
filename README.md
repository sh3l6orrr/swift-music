# 🎼 swift-music

[![CI](https://github.com/sh3l6orrr/swift-music/actions/workflows/CI.yml/badge.svg)](https://github.com/sh3l6orrr/swift-music/actions/workflows/CI.yml)

## Introduction

swift-music is a swift package that provides an easy-to-use API for music related developments.

Currently available module:
- MusicTheory: Notes, chords, scales.

<!--- Songwriting: Melody and chord progressions.-->
<!--- Composition: Tracks.-->
<!--- MusicPlay: A tool to play music.-->

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

// Create with name need to be marked with the try! keyword.
let A7 = try! Chord("A7") 
```

#### Get summary of a chord
```swift
A7.summary
// This is a chord named A7, with root note A, and component notes C#, E, G, which are 
// respectively major third, perfect fifth, minor seventh above the root. 
```

#### Is this chord in my scale?
```swift
try! Chord("Dbm").isIn(scale: .init(.B, .major)) // true
```

#### Get triad in a scale
```swift
Scale(.B, .major).triad(degree: 6) // G#m
```

#### Other API
- Consonance and dissonance of interval, notes, or chord
- Checking if a note in a chord
- Create chord with both sharps and flats
- Create slash chords
- Support for 20+ chord qualities
- Support for 10+ modes (To be implemented)

<!--### Songwriting-->
<!--```swift-->
<!--import SongWriting-->
<!--```-->
<!--#### Compose a Melody-->
<!--```swift-->
<!--let 🎶 = Melody()-->
<!--    .add(MusicNote("E4", value: ._2))-->
<!--    .add(MusicNote("D4", value: ._2))-->
<!--    .add(Pause(._2))-->
<!--    .add(MusicNote("E4", value: ._2))-->
<!--    .add(MusicNote("C4", value: ._1))-->
<!---->
<!--🎶.length // 3 Beats-->
<!--🎶.visualization // To be implemented-->
<!--```-->
<!---->
<!--#### Compose a Chord Progression-->
<!--```swift-->
<!--// To be implemented-->
<!--```-->
<!---->
<!--### Composition-->
<!--```swift-->
<!--import Composition-->
<!--```-->
<!---->
<!--#### Compose a Piece of Music-->
<!--```swift-->
<!--// To be implemented-->
<!--```-->
<!---->
<!--#### Analyze Music-->
<!--```swift-->
<!--// To be implemented-->
<!--```-->
<!--### MusicPlay-->
<!--```swift-->
<!--import MusicPlay-->
<!--```-->
<!---->
<!--#### Play Synth-->
<!--```swift-->
<!--let wave = Wave.sine-->
<!--let oscillator = Oscillator(wave: wave)-->
<!--let synth = Synth(oscillator: oscillator)-->
<!---->
<!--synth.play(MusicNote("C4")!)  // Mac generates sound of 261.63Hz-->
<!--```-->

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

Documentation is contructed with DocC. To build, in Xcode:

Product - Build Documentation 

## License

This project is published under the Apache License 2.0.




