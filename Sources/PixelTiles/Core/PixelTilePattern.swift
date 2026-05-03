//
//  Created by Juri Breslauer on 03.05.2026.
//

public struct PixelTilePattern: Sendable, Equatable {
    public static let validCellRange = 1...9

    public let frames: [[Int]]

    public init(_ frames: [[Int]]) {
        self.frames = frames.map(Self.normalizedFrame)
    }

    public var isEmpty: Bool {
        frames.isEmpty || frames.allSatisfy(\.isEmpty)
    }

    public var invalidCells: [Int] {
        let invalid = frames
            .flatMap { $0 }
            .filter { !Self.validCellRange.contains($0) }

        return Array(Set(invalid)).sorted()
    }

    public var isValid: Bool {
        invalidCells.isEmpty
    }

    public func frame(at index: Int) -> [Int] {
        guard !frames.isEmpty else { return [] }

        let normalizedIndex = ((index % frames.count) + frames.count) % frames.count
        return frames[normalizedIndex]
    }

    private static func normalizedFrame(_ frame: [Int]) -> [Int] {
        var seen = Set<Int>()

        return frame.filter { cell in
            guard !seen.contains(cell) else { return false }
            seen.insert(cell)
            return true
        }
    }
}
