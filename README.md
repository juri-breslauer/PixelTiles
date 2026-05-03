# PixelTiles

A lightweight SwiftUI library for building dynamic, animated tile-based interfaces.

PixelTiles is intended for apps that need reusable tile views, responsive grid layouts,
and smooth SwiftUI-first animations without pulling in a large UI framework.

## Features

- Reusable tile components
- Smooth SwiftUI animations
- SwiftUI-first API design
- Lightweight Swift Package Manager integration

## Installation

### Swift Package Manager

Add PixelTiles to your project in Xcode:

1. Open your project.
2. Go to **File > Add Package Dependencies**.
3. Enter the repository URL:

```text
https://github.com/juri-breslauer/PixelTiles.git
```

Or add it to your `Package.swift` dependencies:

```swift
.package(url: "https://github.com/juri-breslauer/PixelTiles.git", from: "0.1.0")
```

Then add `PixelTiles` to your target dependencies:

```swift
.target(
    name: "YourApp",
    dependencies: ["PixelTiles"]
)
```

## Usage

Import the library in your SwiftUI views:

```swift
import SwiftUI
import PixelTiles
```

Public tile components are under active development. The package currently provides
the `PixelTiles` module scaffold and will grow into a set of reusable SwiftUI tile
building blocks.

## Development

Build the package:

```bash
swift build
```

Run tests:

```bash
swift test
```

## Requirements

- Swift 6
- Swift Package Manager
- Xcode with SwiftUI support

## License

PixelTiles is available under the MIT License. See [LICENSE](LICENSE) for details.
