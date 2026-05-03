//
//  Created by Juri Breslauer on 03.05.2026.
//

import SwiftUI

struct PixelTileCell: View {
    let isActive: Bool
    let tint: Color
    let size: CGFloat
    let glow: PixelTileGlow

    var body: some View {
        Rectangle()
            .fill(isActive ? tint : .clear)
            .frame(width: size, height: size)
            .overlay {
                glowOverlay
            }
    }

    @ViewBuilder
    private var glowOverlay: some View {
        if isActive && glow.layers > 0 {
            ForEach(0..<glow.layers, id: \.self) { layer in
                Rectangle()
                    .fill(tint)
                    .frame(width: size, height: size)
                    .shadow(
                        color: tint.opacity(glow.opacity),
                        radius: glow.radius + CGFloat(layer * 4),
                        x: 0,
                        y: 0
                    )
            }
        }
    }
}
