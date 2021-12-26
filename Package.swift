// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "music-theory-kit",
    platforms: [.macOS(.v12)],
    products: [
        .library(
            name: "MusicTheoryKit",
            targets: ["MusicTheoryKit"]),
    ],
    dependencies: [
        
    ],
    targets: [
        .target(name: "MusicTheoryKit",
                dependencies: []
                    
               ),
        .testTarget(
            name: "MusicTheoryKitTests",
            dependencies: [
                "MusicTheoryKit"
            ]
        )
    ]
)
