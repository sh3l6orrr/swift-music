// swift-tools-version:5.1

import PackageDescription

let 🐱 = "Mascot of this package"

let package = Package(
    name: "swift-music",
    platforms: [.macOS(.v10_15), .iOS(.v8), .watchOS(.v2), .tvOS(.v10)],
    products: [
        .library(
            name: "MusicTheory",
            targets: ["MusicTheory"]
        ),
//         .library(
//             name: "Songwriting",
//             targets: ["Songwriting"]
//         ),
//         .library(
//             name: "Composition",
//             targets: ["Composition"]
//         ),
//         .library(
//             name: "MusicPlay",
//             targets: ["MusicPlay"]
//         ),
    ],
    targets: [
        .target(
            name: "MusicTheory"
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
                .target(name: "MusicTheory")
            ]
        ),
        .testTarget(
            name: "MusicTheoryTests",
            dependencies: ["MusicTheory"]
        ),
        .testTarget(
            name: "SongwritingTests",
            dependencies: ["Songwriting"]
        ),
        .testTarget(
            name: "CompositionTests",
            dependencies: ["Composition"]
        ),
        .testTarget(
            name: "MusicPlayTests",
            dependencies: ["MusicPlay"]
        )
    ]
)

