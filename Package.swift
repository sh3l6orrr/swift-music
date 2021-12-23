// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "music-theory-kit",
    products: [
        .library(
            name: "MusicTheoryKit",
            targets: ["MusicTheoryKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/onevcat/Rainbow.git", .upToNextMajor(from: "4.0.0"))
    ],
    targets: [
        .target(name: "MusicTheoryKit"),
        .testTarget(
            name: "MusicTheoryKitTests",
            dependencies: [
                "MusicTheoryKit",
                .product(name: "Rainbow", package: "Rainbow")
            ]
        )
    ]
)
