import UIKit
import XCTest
@testable import AutoLayoutBuilder

class HorizontalTests: ALBTestCase {

    // MARK: Relative to view

    func testDeclareLeftOfViewEqualToRightOfAnotherView() {
        let constraints = view1[.left] == view2[.right]
        XCTAssertEqual([NSLayoutConstraint(view1, .left, .equal, view2, .right, 1, 0)], constraints)
    }

    func testDeclareLeftOfViewGreaterThanOrEqualToRightOfAnotherView() {
        let constraints = view1[.left] >= view2[.right]
        XCTAssertEqual([NSLayoutConstraint(view1, .left, .greaterThanOrEqual, view2, .right, 1, 0)], constraints)
    }

    func testDeclareLeftOfViewLessThanOrEqualToRightOfAnotherView() {
        let constraints = view1[.left] <= view2[.right]
        XCTAssertEqual([NSLayoutConstraint(view1, .left, .lessThanOrEqual, view2, .right, 1, 0)], constraints)
    }

    func testDeclareLeftOfMultipleViewsEqualToRightOfAnotherView() {
        let constraints = Group(view1,view2)[.left] == view3[.right]
        XCTAssertEqual([
            NSLayoutConstraint(view1, .left, .equal, view3, .right, 1, 0),
            NSLayoutConstraint(view2, .left, .equal, view3, .right, 1, 0)], constraints)
    }

    // MARK: Relative to view with constant

    func testDeclareLeftOfViewEqualToRightOfAnotherViewPlusConstant() {
        let constraints = view1[.left] == view2[.right] + 10
        XCTAssertEqual([NSLayoutConstraint(view1, .left, .equal, view2, .right, 1, 10)], constraints)
    }

    func testDeclareLeftOfViewEqualToRightOfAnotherViewMinusConstant() {
        let constraints = view1[.left] == view2[.right] - 10
        XCTAssertEqual([NSLayoutConstraint(view1, .left, .equal, view2, .right, 1, -10)], constraints)
    }

    // MARK: Relative to view with multiplier

    func testDeclareLeftOfViewEqualToRightOfAnotherViewMultipliedByConstant() {
        let constraints = view1[.left] == view2[.right] * 2
        XCTAssertEqual([NSLayoutConstraint(view1, .left, .equal, view2, .right, 2, 0)], constraints)
    }

    func testDeclareLeftOfViewEqualToRightOfAnotherViewDividedByConstant() {
        let constraints = view1[.left] == view2[.right] / 2
        XCTAssertEqual([NSLayoutConstraint(view1, .left, .equal, view2, .right, 0.5, 0)], constraints)
    }

    // MARK: Relative to view with multiplier and constant

    func testDeclareLeftOfViewEqualToRightOfAnotherViewMultipliedByConstantPlusConstant() {
        let constraints = view1[.left] == view2[.right] * 2 + 10
        XCTAssertEqual([NSLayoutConstraint(view1, .left, .equal, view2, .right, 2, 10)], constraints)
    }

    func testDeclareLeftOfViewEqualToRightOfAnotherViewDividedByConstantMinusConstant() {
        let constraints = view1[.left] == view2[.right] / 2 - 10
        XCTAssertEqual([NSLayoutConstraint(view1, .left, .equal, view2, .right, 0.5, -10)], constraints)
    }
}
