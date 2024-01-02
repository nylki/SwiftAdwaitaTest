// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Adwaita Template",
    dependencies: [
    .package(url: "https://github.com/AparokshaUI/Adwaita.git", branch: "main")
    ],
    targets: [
        .executableTarget(
            name: "AdwaitaTemplate",
            dependencies: [
                .product(name: "Adwaita", package: "Adwaita")
            ],
            path: "Sources"
        )
    ]
)
