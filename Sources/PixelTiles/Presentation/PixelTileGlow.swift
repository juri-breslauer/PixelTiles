//
//  Created by Juri Breslauer on 03.05.2026.
//

import SwiftUI

public struct PixelTileGlow: Sendable, Equatable {
    public static let none = PixelTileGlow(radius: 0, opacity: 0, layers: 0)
    public static let soft = PixelTileGlow(radius: 8, opacity: 0.55, layers: 1)
    public static let bright = PixelTileGlow(radius: 12, opacity: 0.8, layers: 2)

    public let radius: CGFloat
    public let opacity: Double
    public let layers: Int

    public init(radius: CGFloat, opacity: Double, layers: Int = 1) {
        self.radius = max(0, radius)
        self.opacity = min(max(opacity, 0), 1)
        self.layers = max(0, layers)
    }
}
