// swift-tools-version: 6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SDSMarkdownClipPluginProtocol",
    platforms: [
        .macOS(.v14)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SDSMarkdownClipPluginProtocol",
            type: .dynamic,
            targets: ["SDSMarkdownClipPluginProtocol"]
        ),
    ],
    dependencies: [
        //.package(url: "https://github.com/tyagishi/SDSMarkdownEditView", from: "2.0.1"),
        .package(url: "https://github.com/tyagishi/SDSMacros", from: "3.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SDSMarkdownClipPluginProtocol",
            dependencies: ["SDSMacros"],
        ),

    ],
    swiftLanguageModes: [.v6]
)
