import UIKit
import XCTest
@testable import AutoLayoutBuilder

class CenterTests: ALBTestCase {

    // MARK: Relative to view

    func testDeclareCenterOfViewEqualToCenterOfAnotherView() {
        let constraints = view1[.center] == view2[.center]
        XCTAssertEqual([
            NSLayoutConstraint(view1, .centerX, .equal, view2, .centerX, 1, 0),
            NSLayoutConstraint(view1, .centerY, .equal, view2, .centerY, 1, 0)], constraints)
    }

    func testDeclareCenterOfMultipleViewsEqualToCenterOfAnotherView() {
        let constraints = Group(view1,view2)[.center] == view3[.center]
        XCTAssertEqual([
            NSLayoutConstraint(view1, .centerX, .equal, view3, .centerX, 1, 0),
            NSLayoutConstraint(view1, .centerY, .equal, view3, .centerY, 1, 0),
            NSLayoutConstraint(view2, .centerX, .equal, view3, .centerX, 1, 0),
            NSLayoutConstraint(view2, .centerY, .equal, view3, .centerY, 1, 0)], constraints)
    }

    // MARK: Relative to view with constant

    func testDeclareCenterOfViewEqualToCenterOfAnotherViewPlusConstant() {
        let constraints = view1[.center] == view2[.center] + 10
        XCTAssertEqual([
            NSLayoutConstraint(view1, .centerX, .equal, view2, .centerX, 1, 10),
            NSLayoutConstraint(view1, .centerY, .equal, view2, .centerY, 1, 10)], constraints)
    }

    func testDeclareCenterOfViewEqualToCenterOfAnotherViewMinusConstant() {
        let constraints = view1[.center] == view2[.center] - 10
        XCTAssertEqual([
            NSLayoutConstraint(view1, .centerX, .equal, view2, .centerX, 1, -10),
            NSLayoutConstraint(view1, .centerY, .equal, view2, .centerY, 1, -10)], constraints)
    }

    func testDeclareCenterOfViewEqualToCenterOfAnotherViewPlusConstantPair() {
        let constraints = view1[.center] == view2[.center] + (10, 5)
        XCTAssertEqual([
            NSLayoutConstraint(view1, .centerX, .equal, view2, .centerX, 1, 10),
            NSLayoutConstraint(view1, .centerY, .equal, view2, .centerY, 1, 5)], constraints)
    }

    func testDeclareCenterOfViewEqualToCenterOfAnotherViewMinusConstantPair() {
        let constraints = view1[.center] == view2[.center] - (10, 5)
        XCTAssertEqual([
            NSLayoutConstraint(view1, .centerX, .equal, view2, .centerX, 1, -10),
            NSLayoutConstraint(view1, .centerY, .equal, view2, .centerY, 1, -5)], constraints)
    }

    // MARK: Relative to view with multiplier

    func testDeclareCenterOfViewEqualToCenterOfAnotherViewMultipliedByConstant() {
        let constraints = view1[.center] == view2[.center] * 1.25
        XCTAssertEqual([
            NSLayoutConstraint(view1, .centerX, .equal, view2, .centerX, 1.25, 0),
            NSLayoutConstraint(view1, .centerY, .equal, view2, .centerY, 1.25, 0)], constraints)
    }

    func testDeclareCenterOfViewEqualToCenterOfAnotherViewDividedByConstant() {
        let constraints = view1[.center] == view2[.center] / 1.25
        XCTAssertEqual([
            NSLayoutConstraint(view1, .centerX, .equal, view2, .centerX, 0.8, 0),
            NSLayoutConstraint(view1, .centerY, .equal, view2, .centerY, 0.8, 0)], constraints)
    }

    func testDeclareCenterOfViewEqualToCenterOfAnotherViewMultipliedByConstantPair() {
        let constraints = view1[.center] == view2[.center] * (1, 2)
        XCTAssertEqual([
            NSLayoutConstraint(view1, .centerX, .equal, view2, .centerX, 1, 0),
            NSLayoutConstraint(view1, .centerY, .equal, view2, .centerY, 2, 0)], constraints)
    }

    func testDeclareCenterOfViewEqualToCenterOfAnotherViewDividedByConstantPair() {
        let constraints = view1[.center] == view2[.center] / (1, 2)
        XCTAssertEqual([
            NSLayoutConstraint(view1, .centerX, .equal, view2, .centerX, 1, 0),
            NSLayoutConstraint(view1, .centerY, .equal, view2, .centerY, 0.5, 0)], constraints)
    }

    // MARK: Relative to view with multiplier and constant

    func testDeclareCenterOfViewEqualToCenterOfAnotherViewMultipliedByConstantPlusConstant() {
        let constraints = view1[.center] == view2[.center] * CGFloat(1.25) + CGFloat(10)
        XCTAssertEqual([
            NSLayoutConstraint(view1, .centerX, .equal, view2, .centerX, 1.25, 10),
            NSLayoutConstraint(view1, .centerY, .equal, view2, .centerY, 1.25, 10)], constraints)
    }
}
