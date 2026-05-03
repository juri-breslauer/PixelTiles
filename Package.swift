// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "PixelTiles",
    platforms: [
        .iOS(.v17),
        .macOS(.v14),
    ],
    products: [
        .library(
            name: "PixelTiles",
            targets: ["PixelTiles"]
        ),
    ],
    targets: [
        .target(
            name: "PixelTiles"
        ),
    ],
    swiftLanguageModes: [.v6]
)
