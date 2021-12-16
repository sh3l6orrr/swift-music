# Getting Started

Get stared with MusicTheoryKit.

## Overview

Create a music ``Note`` and ``Interval`` as follows:
```swift
let myNote: Note = .C
let myInterval: Interval = .p4
let myAnotherInterval = Interval.p5
```
You can do operation on notes and intervals:
```swift
let newNote = myNote + myInterval
let anotherNewNote = myNote + myAnotherInterval
```
Then, you can form a ``Chord`` with these notes:
```swift
let myChord = Chord(root: myNote, notes: Set([myNote, newNote, anotherNewNote]))
myChord.name == "Csus4"
```
