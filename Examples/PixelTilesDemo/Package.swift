// swift-tools-version: 6.0
//
//  Created by Juri Breslauer on 03.05.2026.
//

import PackageDescription

let package = Package(
    name: "PixelTilesDemo",
    platforms: [
        .macOS(.v14),
    ],
    dependencies: [
        .package(path: "../.."),
    ],
    targets: [
        .executableTarget(
            name: "PixelTilesDemo",
            dependencies: [
                .product(name: "PixelTiles", package: "pixeltiles"),
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)
