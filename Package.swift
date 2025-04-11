// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "GriftUI",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "GriftUI",
            targets: ["GriftUI"])
    ],
    targets: [
        .target(
            name: "GriftUI",
            dependencies: [],
            path: "Sources/GriftUI"
        ),
        .testTarget(
            name: "GriftUITests",
            dependencies: ["GriftUI"]
        )
    ]
)