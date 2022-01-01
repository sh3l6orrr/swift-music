// swift-tools-version:5.5

import PackageDescription

let 🐱 = "Mascot of this package"

let package = Package(
    name: "swift-music",
    platforms: [.macOS(.v10_15), .iOS(.v13), .watchOS(.v2), .tvOS(.v10)],
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
            name: "MusicFoundation",
            dependencies: [
                .target(name: "MusicTheory")
            ]
        ),
        .target(
            name: "Songwriting",
            dependencies: [
                .target(name: "MusicFoundation")
            ]
        ),
        .target(
            name: "Composition",
            dependencies: [
                .target(name: "MusicFoundation")
            ]
        ),
        .target(
            name: "MusicPlay",
            dependencies: [
                .target(name: "MusicFoundation")
            ]
        ),
        .testTarget(
            name: "MusicTheoryTests",
            dependencies: ["MusicTheory"]
        ),
        .testTarget(
            name: "MusicFoundationTests",
            dependencies: ["MusicFoundation"]
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

