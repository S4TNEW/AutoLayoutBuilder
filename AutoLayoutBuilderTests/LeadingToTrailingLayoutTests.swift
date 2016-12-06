import Foundation

import UIKit
import XCTest
@testable import AutoLayoutBuilder

class LeadingToTrailingLayoutTests: ALBTestCase {

}

extension LeadingToTrailingLayoutTests: LayoutTestSpecification {

    func testLayoutWithTwoAdjacentViews() {
        let constraints = .leadingToTrailing ~ view1 | view2
        XCTAssertEqual([NSLayoutConstraint(view2, .leading, .equal, view1, .trailing, 1, 0)], constraints)
    }

    func testLayoutWithThreeAdjacentViews() {
        let constraints = .leadingToTrailing ~ view1 | view2 | view3
        XCTAssertEqual([
            NSLayoutConstraint(view2, .leading, .equal, view1, .trailing, 1, 0),
            NSLayoutConstraint(view3, .leading, .equal, view2, .trailing, 1, 0)], constraints)
    }

    func testLayoutWithTwoViewsSeparatedByMargin() {
        let constraints = .leadingToTrailing ~ view1 | 10 | view2
        XCTAssertEqual([NSLayoutConstraint(view2, .leading, .equal, view1, .trailing, 1, 10)], constraints)
    }

    func testLayoutWithThreeViewsSeparatedByDifferingMargins() {
        let constraints = .leadingToTrailing ~ view1 | 10 | view2 | 20 | view3
        XCTAssertEqual([
            NSLayoutConstraint(view2, .leading, .equal, view1, .trailing, 1, 10),
            NSLayoutConstraint(view3, .leading, .equal, view2, .trailing, 1, 20)], constraints)
    }

    func testLayoutWithThreeViewsWithFirstAndSecondSeparatedByMargin() {
        let constraints = .leadingToTrailing ~ view1 | 10 | view2 | view3
        XCTAssertEqual([
            NSLayoutConstraint(view2, .leading, .equal, view1, .trailing, 1, 10),
            NSLayoutConstraint(view3, .leading, .equal, view2, .trailing, 1, 0)], constraints)
    }

    func testLayoutWithThreeViewsWithSecondAndThirdSeparatedByMargin() {
        let constraints = .leadingToTrailing ~ view1 | view2 | 10 | view3
        XCTAssertEqual([
            NSLayoutConstraint(view2, .leading, .equal, view1, .trailing, 1, 0),
            NSLayoutConstraint(view3, .leading, .equal, view2, .trailing, 1, 10)], constraints)
    }

    func testLayoutWithViewGroup() {
        let constraints = .leadingToTrailing ~ Group(view1, view2, view3)
        XCTAssertEqual([
            NSLayoutConstraint(view2, .leading, .equal, view1, .trailing, 1, 0),
            NSLayoutConstraint(view3, .leading, .equal, view2, .trailing, 1, 0)], constraints)
    }
}
