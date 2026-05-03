// swift-tools-version: 6.0
//
//  Created by Juri Breslauer on 03.05.2026.
//

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
        .library(
            name: "PixelTilesDemoSupport",
            targets: ["PixelTilesDemoSupport"]
        ),
    ],
    targets: [
        .target(
            name: "PixelTiles"
        ),
        .target(
            name: "PixelTilesDemoSupport",
            dependencies: ["PixelTiles"]
        ),
        .testTarget(
            name: "PixelTilesTests",
            dependencies: ["PixelTiles"]
        ),
    ],
    swiftLanguageModes: [.v6]
)
