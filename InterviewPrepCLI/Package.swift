// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "InterviewPrepCLI",
    dependencies: [
    .package(path: "../InterviewPrepCore")
    ],
    targets: [
        .target(
            name: "InterviewPrepCLI",
            dependencies: ["InterviewPrepCore"]),
        .testTarget(
            name: "InterviewPrepCLITests",
            dependencies: ["InterviewPrepCLI"]),
    ]
)
