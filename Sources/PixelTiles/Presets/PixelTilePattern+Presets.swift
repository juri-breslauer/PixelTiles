//
//  Created by Juri Breslauer on 03.05.2026.
//

public extension PixelTilePattern {
    static let pulse = PixelTilePattern([
        [5],
        [2, 4, 6, 8],
        [1, 3, 7, 9],
    ])

    static let plus = PixelTilePattern([
        [2],
        [4],
        [6],
        [8],
    ])

    static let frame = PixelTilePattern([
        [1, 2, 3, 6, 9, 8, 7, 4],
    ])

    static let corners = PixelTilePattern([
        [1],
        [3],
        [9],
        [7],
    ])

    static let diagonal = PixelTilePattern([
        [1],
        [5],
        [9],
    ])

    static let scanLeftToRight = PixelTilePattern([
        [1, 4, 7],
        [2, 5, 8],
        [3, 6, 9],
    ])

    static let scanTopToBottom = PixelTilePattern([
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9],
    ])

    static let spiral = PixelTilePattern([
        [1],
        [2],
        [3],
        [6],
        [9],
        [8],
        [7],
        [4],
    ])
}
