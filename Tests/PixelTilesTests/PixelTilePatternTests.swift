//
//  Created by Juri Breslauer on 03.05.2026.
//

import XCTest
@testable import PixelTiles

final class PixelTilePatternTests: XCTestCase {
    func testRemovesDuplicateCellsWithinFrame() {
        let pattern = PixelTilePattern([[1, 1, 2, 2, 3]])

        XCTAssertEqual(pattern.frames, [[1, 2, 3]])
    }

    func testReportsInvalidCellsOutsideGridRange() {
        let pattern = PixelTilePattern([[0, 1, 10], [-1, 9, 10]])

        XCTAssertEqual(pattern.invalidCells, [-1, 0, 10])
        XCTAssertFalse(pattern.isValid)
    }

    func testWrapsFrameLookupByPatternLength() {
        let pattern = PixelTilePattern([[1], [2], [3]])

        XCTAssertEqual(pattern.frame(at: 0), [1])
        XCTAssertEqual(pattern.frame(at: 3), [1])
        XCTAssertEqual(pattern.frame(at: 4), [2])
        XCTAssertEqual(pattern.frame(at: -1), [3])
    }

    func testBuiltInPresetsAreValid() {
        let presets: [PixelTilePattern] = [
            .pulse,
            .plus,
            .frame,
            .corners,
            .diagonal,
            .scanLeftToRight,
            .scanTopToBottom,
            .spiral,
        ]

        XCTAssertTrue(presets.allSatisfy(\.isValid))
    }
}
