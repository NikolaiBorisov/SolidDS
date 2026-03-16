// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SolidDS",
    
    defaultLocalization: "en",
    
    platforms: [
        .iOS(.v15)
    ],
    
    products: [
        .library(
            name: "SolidDS",
            targets: ["SolidDS"]
        )
    ],
    
    targets: [
        .target(
            name: "SolidDS",
            resources: [
                .process("Resources")
            ]
        ),
        .testTarget(
            name: "SolidDSTests",
            dependencies: ["SolidDS"]
        )
    ]
)
