import Foundation
import UIKit
import XCTest
@testable import AutoLayoutBuilder

class HorizontalLayoutTests: ALBTestCase {

}

extension HorizontalLayoutTests: LayoutTestSpecification {

    func testLayoutWithTwoAdjacentViews() {
        let constraints = .horizontal ~ view1 | view2
        XCTAssertEqual([NSLayoutConstraint(view2, .left, .equal, view1, .right, 1, 0)], constraints)
    }

    func testLayoutWithThreeAdjacentViews() {
        let constraints = .horizontal ~ view1 | view2 | view3
        XCTAssertEqual([
            NSLayoutConstraint(view2, .left, .equal, view1, .right, 1, 0),
            NSLayoutConstraint(view3, .left, .equal, view2, .right, 1, 0)], constraints)
    }

    func testLayoutWithTwoViewsSeparatedByMargin() {
        let constraints = .horizontal ~ view1 | 10 | view2
        XCTAssertEqual([NSLayoutConstraint(view2, .left, .equal, view1, .right, 1, 10)], constraints)
    }

    func testLayoutWithThreeViewsSeparatedByDifferingMargins() {
        let constraints = .horizontal ~ view1 | 10 | view2 | 20 | view3
        XCTAssertEqual([
            NSLayoutConstraint(view2, .left, .equal, view1, .right, 1, 10),
            NSLayoutConstraint(view3, .left, .equal, view2, .right, 1, 20)], constraints)
    }

    func testLayoutWithThreeViewsWithFirstAndSecondSeparatedByMargin() {
        let constraints = .horizontal ~ view1 | 10 | view2 | view3
        XCTAssertEqual([
            NSLayoutConstraint(view2, .left, .equal, view1, .right, 1, 10),
            NSLayoutConstraint(view3, .left, .equal, view2, .right, 1, 0)], constraints)
    }

    func testLayoutWithThreeViewsWithSecondAndThirdSeparatedByMargin() {
        let constraints = .horizontal ~ view1 | view2 | 10 | view3
        XCTAssertEqual([
            NSLayoutConstraint(view2, .left, .equal, view1, .right, 1, 0),
            NSLayoutConstraint(view3, .left, .equal, view2, .right, 1, 10)], constraints)
    }

    func testLayoutWithViewGroup() {
        let constraints = .horizontal ~ Group(view1, view2)
        XCTAssertEqual([
            NSLayoutConstraint(view2, .left, .equal, view1, .right, 1, 0)], constraints)
    }
}
