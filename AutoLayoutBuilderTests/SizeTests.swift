import UIKit
import XCTest
@testable import AutoLayoutBuilder

class SizeTests: ALBTestCase {

    // MARK: Relative to view

    func testDeclareSizeOfViewEqualToSizeOfAnotherView() {
        let constraints = view1[.size] == view2[.size]
        XCTAssertEqual([
            NSLayoutConstraint(view1, .width, .equal, view2, .width, 1, 0),
            NSLayoutConstraint(view1, .height, .equal, view2, .height, 1, 0)], constraints)
    }

    func testDeclareSizeOfMultipleViewsEqualToSizeOfAnotherView() {
        let constraints = Group(view1,view2)[.size] == view3[.size]
        XCTAssertEqual([
            NSLayoutConstraint(view1, .width, .equal, view3, .width, 1, 0),
            NSLayoutConstraint(view1, .height, .equal, view3, .height, 1, 0),
            NSLayoutConstraint(view2, .width, .equal, view3, .width, 1, 0),
            NSLayoutConstraint(view2, .height, .equal, view3, .height, 1, 0)], constraints)
    }

    // MARK: Relative to view with constant

    func testDeclareSizeOfViewEqualToSizeOfAnotherViewPlusConstant() {
        let constraints = view1[.size] == view2[.size] + 10
        XCTAssertEqual([
            NSLayoutConstraint(view1, .width, .equal, view2, .width, 1, 10),
            NSLayoutConstraint(view1, .height, .equal, view2, .height, 1, 10)], constraints)
    }

    func testDeclareSizeOfViewEqualToSizeOfAnotherViewMinusConstant() {
        let constraints = view1[.size] == view2[.size] - 10
        XCTAssertEqual([
            NSLayoutConstraint(view1, .width, .equal, view2, .width, 1, -10),
            NSLayoutConstraint(view1, .height, .equal, view2, .height, 1, -10)], constraints)
    }

    func testDeclareSizeOfViewEqualToSizeOfAnotherViewPlusConstantTuple() {
        let constraints = view1[.size] == view2[.size] + (10, 20)
        XCTAssertEqual([
            NSLayoutConstraint(view1, .width, .equal, view2, .width, 1, 10),
            NSLayoutConstraint(view1, .height, .equal, view2, .height, 1, 20)], constraints)
    }

    func testDeclareSizeOfViewEqualToSizeOfAnotherViewMinusConstantTuple() {
        let constraints = view1[.size] == view2[.size] - (10, 20)
        XCTAssertEqual([
            NSLayoutConstraint(view1, .width, .equal, view2, .width, 1, -10),
            NSLayoutConstraint(view1, .height, .equal, view2, .height, 1, -20)], constraints)
    }

    // MARK: Relative to view with multiplier

    func testDeclareSizeOfViewEqualToSizeOfAnotherViewMultipliedByConstant() {
        let constraints = view1[.size] == view2[.size] * 1.5
        XCTAssertEqual([
            NSLayoutConstraint(view1, .width, .equal, view2, .width, 1.5, 0),
            NSLayoutConstraint(view1, .height, .equal, view2, .height, 1.5, 0)], constraints)
    }

    func testDeclareSizeOfViewEqualToSizeOfAnotherViewDividedByConstant() {
        let constraints = view1[.size] == view2[.size] / 0.75
        XCTAssertEqual([
            NSLayoutConstraint(view1, .width, .equal, view2, .width, 1/0.75, 0),
            NSLayoutConstraint(view1, .height, .equal, view2, .height, 1/0.75, 0)], constraints)
    }

    func testDeclareSizeOfViewEqualToSizeOfAnotherViewMultipliedByConstantTuple() {
        let constraints = view1[.size] == view2[.size] * (1, 2)
        XCTAssertEqual([
            NSLayoutConstraint(view1, .width, .equal, view2, .width, 1, 0),
            NSLayoutConstraint(view1, .height, .equal, view2, .height, 2, 0)], constraints)
    }

    func testDeclareSizeOfViewEqualToSizeOfAnotherViewDivideddByConstantTuple() {
        let constraints = view1[.size] == view2[.size] / (2, 3)
        XCTAssertEqual([
            NSLayoutConstraint(view1, .width, .equal, view2, .width, 1/2, 0),
            NSLayoutConstraint(view1, .height, .equal, view2, .height, 1/3, 0)], constraints)
    }

    // MARK: Relative to view with multiplier and constant

    func testDeclareSizeOfViewEqualToSizeOfAnotherViewDividedByConstantPlusConstant() {
        let constraints = view1[.size] == view2[.size] / 0.75 + CGFloat(20)
        XCTAssertEqual([
            NSLayoutConstraint(view1, .width, .equal, view2, .width, 1/0.75, 20),
            NSLayoutConstraint(view1, .height, .equal, view2, .height, 1/0.75, 20)], constraints)
    }

    // MARK: Fixed to constant

    func testDeclareSizeOfViewEqualToSize() {
        let constraints = view1[.size] == CGSize(width: 50, height: 100)
        XCTAssertEqual([
            NSLayoutConstraint(view1, .width, .equal, nil, .notAnAttribute, 1, 50),
            NSLayoutConstraint(view1, .height, .equal, nil, .notAnAttribute, 1, 100)], constraints)
    }
}
