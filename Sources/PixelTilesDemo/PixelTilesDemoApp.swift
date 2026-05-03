//
//  Created by Juri Breslauer on 03.05.2026.
//

import PixelTiles
import SwiftUI

@main
struct PixelTilesDemoApp: App {
    var body: some Scene {
        WindowGroup {
            DemoView()
        }
        .windowResizability(.contentSize)
    }
}

private struct DemoView: View {
    private let samples: [LoaderSample] = [
        LoaderSample(name: "Plus", pattern: .plus, tint: Color(red: 0.70, green: 0.88, blue: 1.00), glow: .bright),
        LoaderSample(name: "Frame", pattern: .frame, tint: .cyan, glow: .soft),
        LoaderSample(name: "Spiral", pattern: .spiral, tint: .pink, glow: .bright),
        LoaderSample(name: "Scan", pattern: .scanLeftToRight, tint: .mint, glow: .soft),
        LoaderSample(name: "Pulse", pattern: .pulse, tint: .purple, glow: .bright),
        LoaderSample(name: "Corners", pattern: .corners, tint: .orange, glow: .soft),
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 28) {
            VStack(alignment: .leading, spacing: 8) {
                Text("PixelTiles")
                    .font(.system(size: 32, weight: .semibold, design: .rounded))
                    .foregroundStyle(.white)

                Text("SwiftUI pixel loaders built from animated 3x3 patterns.")
                    .font(.system(size: 14, weight: .medium, design: .rounded))
                    .foregroundStyle(.white.opacity(0.62))
            }

            LazyVGrid(
                columns: Array(repeating: GridItem(.fixed(136), spacing: 18), count: 3),
                spacing: 18
            ) {
                ForEach(samples) { sample in
                    LoaderSampleView(sample: sample)
                }
            }
        }
        .padding(32)
        .frame(width: 516)
        .background(Color.black)
    }
}

private struct LoaderSampleView: View {
    let sample: LoaderSample

    var body: some View {
        VStack(spacing: 14) {
            PixelTileLoader(
                pattern: sample.pattern,
                tint: sample.tint,
                cellSize: 16,
                spacing: 2,
                interval: sample.interval,
                glow: sample.glow
            )

            Text(sample.name)
                .font(.system(size: 13, weight: .medium, design: .rounded))
                .foregroundStyle(.white.opacity(0.68))
        }
        .frame(width: 136, height: 112)
        .background(Color.white.opacity(0.055))
        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
    }
}

private struct LoaderSample: Identifiable {
    let id = UUID()
    let name: String
    let pattern: PixelTilePattern
    let tint: Color
    let glow: PixelTileGlow
    let interval: TimeInterval

    init(
        name: String,
        pattern: PixelTilePattern,
        tint: Color,
        glow: PixelTileGlow,
        interval: TimeInterval = 0.18
    ) {
        self.name = name
        self.pattern = pattern
        self.tint = tint
        self.glow = glow
        self.interval = interval
    }
}

private struct DemoViewPreviews: PreviewProvider {
    static var previews: some View {
        DemoView()
    }
}
