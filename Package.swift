// swift-tools-version:5.8

import PackageDescription

let 🐱 = "Mascot of this package"

let package = Package(
    name: "swift-music",
    platforms: [.macOS(.v13), .iOS(.v11), .watchOS(.v4), .tvOS(.v11)],
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
        ),
        .executableTarget(
            name: "Run",
            dependencies: ["MusicTheory"]
        )
    ]
)

