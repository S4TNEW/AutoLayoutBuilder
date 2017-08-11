import UIKit
import XCTest
@testable import AutoLayoutBuilder

class Tests: ALBTestCase {

    // MARK: Equal Heights Tests

    func testEqualHeightsWithTwoViews() {
        let constraints = equalHeights(view1, view2)
        XCTAssertEqual([NSLayoutConstraint(view1, .height, .equal, view2, .height, 1, 0)], constraints)
    }

    func testEqualHeightsWithThreeViews() {
        let constraints = equalHeights(view1, view2, view3)
        XCTAssertEqual([
            NSLayoutConstraint(view1, .height, .equal, view2, .height, 1, 0),
            NSLayoutConstraint(view1, .height, .equal, view3, .height, 1, 0)
            ], constraints)
    }

    // MARK: Equal Widths Tests

    func testEqualWidthWithTwoViews() {
        let constraints = equalWidths(view1, view2)
        XCTAssertEqual([NSLayoutConstraint(view1, .width, .equal, view2, .width, 1, 0)], constraints)
    }

    func testEqualWidthsWithThreeViews() {
        let constraints = equalWidths(view1, view2, view3)
        XCTAssertEqual([
            NSLayoutConstraint(view1, .width, .equal, view2, .width, 1, 0),
            NSLayoutConstraint(view1, .width, .equal, view3, .width, 1, 0)
            ], constraints)
    }
}
