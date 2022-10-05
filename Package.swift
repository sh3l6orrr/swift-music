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
        )
    ],
    targets: [
        .target(
            name: "MusicTheory"
        ),
        .testTarget(
            name: "MusicTheoryTests",
            dependencies: ["MusicTheory"]
        )
    ]
)

