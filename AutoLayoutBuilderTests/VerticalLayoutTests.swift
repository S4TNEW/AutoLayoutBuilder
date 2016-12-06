import UIKit
import XCTest
@testable import AutoLayoutBuilder

class VerticalLayoutTests: ALBTestCase {

}

extension VerticalLayoutTests: LayoutTestSpecification {

    func testLayoutWithTwoAdjacentViews() {
        let constraints = .vertical ~ view1 | view2
        XCTAssertEqual([NSLayoutConstraint(view2, .top, .equal, view1, .bottom, 1, 0)], constraints)
    }

    func testLayoutWithThreeAdjacentViews() {
        let constraints = .vertical ~ view1 | view2 | view3
        XCTAssertEqual([
            NSLayoutConstraint(view2, .top, .equal, view1, .bottom, 1, 0),
            NSLayoutConstraint(view3, .top, .equal, view2, .bottom, 1, 0)], constraints)
    }

    func testLayoutWithTwoViewsSeparatedByMargin() {
        let constraints = .vertical ~ view1 | 10 | view2
        XCTAssertEqual([NSLayoutConstraint(view2, .top, .equal, view1, .bottom, 1, 10)], constraints)
    }

    func testLayoutWithThreeViewsSeparatedByDifferingMargins() {
        let constraints = .vertical ~ view1 | 10 | view2 | 20 | view3
        XCTAssertEqual([
            NSLayoutConstraint(view2, .top, .equal, view1, .bottom, 1, 10),
            NSLayoutConstraint(view3, .top, .equal, view2, .bottom, 1, 20)], constraints)
    }

    func testLayoutWithThreeViewsWithFirstAndSecondSeparatedByMargin() {
        let constraints = .vertical ~ view1 | 10 | view2 | view3
        XCTAssertEqual([
            NSLayoutConstraint(view2, .top, .equal, view1, .bottom, 1, 10),
            NSLayoutConstraint(view3, .top, .equal, view2, .bottom, 1, 0)], constraints)
    }

    func testLayoutWithThreeViewsWithSecondAndThirdSeparatedByMargin() {
        let constraints = .vertical ~ view1 | view2 | 10 | view3
        XCTAssertEqual([
            NSLayoutConstraint(view2, .top, .equal, view1, .bottom, 1, 0),
            NSLayoutConstraint(view3, .top, .equal, view2, .bottom, 1, 10)], constraints)
    }

    func testLayoutWithViewGroup() {
        let constraints = .vertical ~ Group(view1, view2, view3)
        XCTAssertEqual([
            NSLayoutConstraint(view2, .top, .equal, view1, .bottom, 1, 0),
            NSLayoutConstraint(view3, .top, .equal, view2, .bottom, 1, 0)], constraints)
    }
}
