# MusicTheoryKit

[![CI](https://github.com/sh3l6orrr/music-theory-kit/actions/workflows/CI.yml/badge.svg)](https://github.com/sh3l6orrr/music-theory-kit/actions/workflows/CI.yml)

### Introduction

MusicTheoryKit is a Swift framework that provides an easy-to-use API for most commonly used music terms.

### Installation

- Xcode 

> File - Add Packages - https://github.com/sh3l6orrr/music-theory-kit.git

- Swift Package Manager 

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

