// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PZCircularControl",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "PZCircularControl",
            targets: ["PZCircularControl"]),
    ],
    platforms: [
        .iOS(.v13), .macOS(.v10_15), .watchOS(.v6), .tvOS(.v13)
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "PZCircularControl",
            dependencies: []),
        .testTarget(
            name: "PZCircularControlTests",
            dependencies: ["PZCircularControl"]),
    ]
)
