// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "InterviewPrepCore",
    products: [
        .library(
            name: "InterviewPrepCore",
            targets: ["InterviewPrepCore"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "InterviewPrepCore",
            dependencies: []),
        .testTarget(
            name: "InterviewPrepCoreTests",
            dependencies: ["InterviewPrepCore"]),
    ]
)
