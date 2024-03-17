// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import CompilerPluginSupport

let package = Package(
    name: "SwiftID",
    platforms: [.macOS(.v10_15), .iOS(.v13), .tvOS(.v13), .watchOS(.v6)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "SwiftID",
            targets: ["SwiftID"]),
        .executable(
            name: "SwiftIdentifiableClient",
            targets: ["SwiftIdentifiableClient"]
        ),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/apple/swift-syntax.git", from: "510.0.1")
    ],
    targets: [
        .macro(
            name: "SwiftIdentifiableMacros",
            dependencies: [
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax"),
            ]
        ),
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "SwiftID",
            dependencies: [
                "SwiftIdentifiableMacros"
            ]),
        .executableTarget(
            name: "SwiftIdentifiableClient",
            dependencies: ["SwiftID"]
        ),
        .testTarget(
            name: "SwiftIDTests",
            dependencies: ["SwiftID"]),
    ]
)
