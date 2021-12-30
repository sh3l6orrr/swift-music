// swift-tools-version:5.5

import PackageDescription

let 🐱 = "Mascot of this package"

let package = Package(
    name: "swift-music",
    platforms: [.macOS(.v10_15), .iOS(.v13), .watchOS(.v2), .tvOS(.v10)],
    products: [
        .library(
            name: "music-theory",
            targets: ["MusicTheory"]
        ),
        .library(
            name: "songwriting",
            targets: ["Songwriting"]
        ),
        .library(
            name: "composition",
            targets: ["Composition"]
        ),
        .library(
            name: "music-play",
            targets: ["MusicPlay"]
        ),
    ],
    dependencies: [
        
    ],
    targets: [
        .target(name: "StringHelper"),
        .target(
            name: "MusicTheory",
            dependencies: [
                .target(name: "StringHelper")
            ]
        ),
        .target(
            name: "Songwriting",
            dependencies: [
                .target(name: "MusicTheory")
            ]
        ),
        .target(
            name: "Composition",
            dependencies: [
                .target(name: "MusicTheory")
            ]
        ),
        .target(
            name: "MusicPlay",
            dependencies: [
                
            ]
        ),
        .testTarget(
            name: "MusicTheoryTests",
            dependencies: [
                "MusicTheory"
            ]
        )
    ]
)

