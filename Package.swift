// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let kPackage = Package(
    name: "Boxes",
    platforms: [
        .macOS(.v11)
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(
            url: "https://github.com/tuist/ProjectDescription.git",
            .upToNextMajor(from: "3.14.0")
        )
    ],
    targets: [
        .target(
            name: "Tuist",
            dependencies: ["ProjectDescription"],
            path: "./Tuist"
        )
    ]
)
