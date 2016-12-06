import UIKit
import XCTest
@testable import AutoLayoutBuilder

class DimensionTests: ALBTestCase {

    // MARK: Relative to view

    func testDeclareWidthOfViewEqualToWidthOfAnotherView() {
        let constraints = view1[.width] == view2[.width]
        XCTAssertEqual([NSLayoutConstraint(view1, .width, .equal, view2, .width, 1, 0)], constraints)
    }

    func testDeclareWidthOfViewEqualToHeightOfView() {
        let constraints = view1[.width] == view1[.height]
        XCTAssertEqual([NSLayoutConstraint(view1, .width, .equal, view1, .height, 1, 0)], constraints)
    }

    func testDeclareHeightOfMultipleViewsEqualToHeightOfAnotherView() {
        let constraints = Group(view1,view2)[.height] == view3[.height]
        XCTAssertEqual([
            NSLayoutConstraint(view1, .height, .equal, view3, .height, 1, 0),
            NSLayoutConstraint(view2, .height, .equal, view3, .height, 1, 0)], constraints)
    }

    func testDeclareWidthOfViewGreaterThanOrEqualToWidthOfAnotherView() {
        let constraints = view1[.width] >= view2[.width]
        XCTAssertEqual([NSLayoutConstraint(view1, .width, .greaterThanOrEqual, view2, .width, 1, 0)], constraints)
    }

    func testDeclareWidthOfViewLessThanOrEqualToWidthOfAnotherView() {
        let constraints = view1[.width] <= view2[.width]
        XCTAssertEqual([NSLayoutConstraint(view1, .width, .lessThanOrEqual, view2, .width, 1, 0)], constraints)
    }

    // MARK: Relative to view with constant

    func testDeclareWidthOfViewEqualToWidthOfAnotherViewPlusConstant() {
        let constraints = view1[.width] == view2[.width] + 10
        XCTAssertEqual([NSLayoutConstraint(view1, .width, .equal, view2, .width, 1, 10)], constraints)
    }

    func testDeclareWidthOfViewEqualToWidthOfAnotherViewMinusConstant() {
        let constraints = view1[.width] == view2[.width] - 10
        XCTAssertEqual([NSLayoutConstraint(view1, .width, .equal, view2, .width, 1, -10)], constraints)
    }

    // MARK: Relative to view with multiplier

    func testDeclareWidthOfViewEqualToWidthOfAnotherViewMultipliedByConstant() {
        let constraints = view1[.width] == view2[.width] * 2
        XCTAssertEqual([NSLayoutConstraint(view1, .width, .equal, view2, .width, 2, 0)], constraints)
    }

    func testDeclareWidthOfViewEqualToWidthOfAnotherViewDividedByConstant() {
        let constraints = view1[.width] == view2[.width] / 2
        XCTAssertEqual([NSLayoutConstraint(view1, .width, .equal, view2, .width, 0.5, 0)], constraints)
    }

    // MARK: Fixed to constant

    func testDeclareWidthOfViewEqualToConstant() {
        let constraints = view1[.width] == 10
        XCTAssertEqual([
            NSLayoutConstraint(view1, .width, .equal, nil, .notAnAttribute, 1, 10)], constraints)
    }

    func testDeclareWidthOfViewEqualToOrGreaterThanConstant() {
        let constraints = view1[.width] >= 10
        XCTAssertEqual([NSLayoutConstraint(view1, .width, .greaterThanOrEqual, nil, .notAnAttribute, 1, 10)], constraints)
    }

    func testDeclareWidthOfViewEqualToOrLessThanConstant() {
        let constraints = view1[.width] <= 10
        XCTAssertEqual([NSLayoutConstraint(view1, .width, .lessThanOrEqual, nil, .notAnAttribute, 1, 10)], constraints)
    }
}
