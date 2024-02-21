// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AsyncPlotTabler",
    platforms: [
       .macOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "AsyncPlotTabler",
            targets: ["AsyncPlotTabler"]
        ),
        .executable(name: "Demo", targets: ["Demo"]),
    ],
    dependencies: [
        // 🧱 Plot a DSL for writing type-safe HTML
        // - Note: the fork at btoms20 is an Async/Await version of Plot
        .package(url: "https://github.com/btoms20/Plot.git", branch: "master"),
        // Vapor (for the Demo)
        .package(url: "https://github.com/vapor/vapor.git", from: "4.91.1"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "AsyncPlotTabler",
            dependencies: [
                .product(name: "Plot", package: "Plot")
            ]
        ),
        .testTarget(
            name: "AsyncPlotTablerTests",
            dependencies: ["AsyncPlotTabler"]
        ),
        .executableTarget(
            name: "Demo",
            dependencies: [
                .target(name: "AsyncPlotTabler"),
                .product(name: "Vapor", package: "vapor"),
            ]
        ),
    ]
)
