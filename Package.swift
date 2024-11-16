// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "Navigation",
    platforms: [
        .iOS(.v16),
        .macOS(.v13),
        .tvOS(.v16),
        .watchOS(.v9)
    ],
    products: [
        .library(
            name: "Navigation",
            targets: ["Navigation"]
        )
    ],
    targets: [
        .target(
            name: "Navigation"
        ),
        .testTarget(
            name: "NavigationTests",
            dependencies: ["Navigation"]
        )
    ]
)
