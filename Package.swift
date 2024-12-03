// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "advent-of-code",
    platforms: [.macOS(.v15)],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-parsing", from: "0.13.0"),
        .package(url: "https://github.com/pointfreeco/swift-tagged", from: "0.10.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Advent2024",
            dependencies: [
                .product(name: "Parsing", package: "swift-parsing"),
                .product(name: "Tagged", package: "swift-tagged")
            ]
        ),
        .testTarget(
            name: "Advent2024Tests",
            dependencies: ["Advent2024"],
            resources: [
                .process("Inputs")
            ]
        )
    ]
)
