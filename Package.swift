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
        .package(name: "swift-parsing", url: "https://github.com/pointfreeco/swift-parsing.git", from: "0.4.0")
    ],
    targets: [
        .target(name: "MusicTheoryKit",
                dependencies: [
                    .product(name: "Parsing", package: "swift-parsing")]
               ),
        .testTarget(
            name: "MusicTheoryKitTests",
            dependencies: [
                "MusicTheoryKit"
            ]
        )
    ]
)
