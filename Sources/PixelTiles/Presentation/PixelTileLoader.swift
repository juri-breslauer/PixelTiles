//
//  Created by Juri Breslauer on 03.05.2026.
//

import SwiftUI

public struct PixelTileLoader: View {
    private let pattern: PixelTilePattern
    private let tint: Color
    private let cellSize: CGFloat
    private let spacing: CGFloat
    private let interval: TimeInterval
    private let animationDuration: TimeInterval
    private let glow: PixelTileGlow

    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @State private var frameIndex = 0

    public init(
        pattern: PixelTilePattern = .plus,
        tint: Color = .cyan,
        cellSize: CGFloat = 8,
        spacing: CGFloat = 1,
        interval: TimeInterval = 0.18,
        animationDuration: TimeInterval = 0.16,
        glow: PixelTileGlow = .soft
    ) {
        self.pattern = pattern
        self.tint = tint
        self.cellSize = max(1, cellSize)
        self.spacing = max(0, spacing)
        self.interval = max(0.05, interval)
        self.animationDuration = max(0, animationDuration)
        self.glow = glow
    }

    public var body: some View {
        let activeCells = Set(pattern.frame(at: reduceMotion ? 0 : frameIndex))

        VStack(spacing: spacing) {
            ForEach(0..<3, id: \.self) { row in
                HStack(spacing: spacing) {
                    ForEach(0..<3, id: \.self) { column in
                        let cell = row * 3 + column + 1

                        PixelTileCell(
                            isActive: activeCells.contains(cell),
                            tint: tint,
                            size: cellSize,
                            glow: glow
                        )
                    }
                }
            }
        }
        .fixedSize()
        .task(id: reduceMotion) {
            await animateFrames()
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Loading")
    }

    private func animateFrames() async {
        guard !reduceMotion, pattern.isValid, !pattern.isEmpty else { return }

        while !Task.isCancelled {
            try? await Task.sleep(for: .seconds(interval))

            guard !Task.isCancelled else { return }

            withAnimation(.smooth(duration: animationDuration)) {
                frameIndex += 1
            }
        }
    }
}
