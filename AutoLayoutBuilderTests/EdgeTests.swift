import UIKit
import XCTest
@testable import AutoLayoutBuilder

class EdgeTests: ALBTestCase {

    // MARK: Relative to view

    func testDeclareEdgesOfViewEqualToEdgesOfAnotherView() {
        let constraints = view1[.edges] == view2[.edges]
        XCTAssertEqual([
            NSLayoutConstraint(view1, .left, .equal, view2, .left, 1, 0),
            NSLayoutConstraint(view1, .right, .equal, view2, .right, 1, 0),
            NSLayoutConstraint(view1, .top, .equal, view2, .top, 1, 0),
            NSLayoutConstraint(view1, .bottom, .equal, view2, .bottom, 1, 0)], constraints)
    }

    func testDeclareEdgesOfMultipleViewsEqualToEdgesOfAnotherView() {
        let constraints = Group(view1,view2)[.edges] == view3[.edges]
        XCTAssertEqual([
            NSLayoutConstraint(view1, .left, .equal, view3, .left, 1, 0),
            NSLayoutConstraint(view1, .right, .equal, view3, .right, 1, 0),
            NSLayoutConstraint(view1, .top, .equal, view3, .top, 1, 0),
            NSLayoutConstraint(view1, .bottom, .equal, view3, .bottom, 1, 0),
            NSLayoutConstraint(view2, .left, .equal, view3, .left, 1, 0),
            NSLayoutConstraint(view2, .right, .equal, view3, .right, 1, 0),
            NSLayoutConstraint(view2, .top, .equal, view3, .top, 1, 0),
            NSLayoutConstraint(view2, .bottom, .equal, view3, .bottom, 1, 0)], constraints)
    }

    // MARK: Relative to view with constant

    func testDeclareEdgesOfViewEqualToEdgesOfAnotherViewPlusConstant() {
        let constraints = view1[.edges] == view2[.edges] + 5
        XCTAssertEqual([
            NSLayoutConstraint(view1, .left, .equal, view2, .left, 1, -5),
            NSLayoutConstraint(view1, .right, .equal, view2, .right, 1, 5),
            NSLayoutConstraint(view1, .top, .equal, view2, .top, 1, -5),
            NSLayoutConstraint(view1, .bottom, .equal, view2, .bottom, 1, 5)], constraints)
    }

    func testDeclareEdgesOfViewEqualToEdgesOfAnotherViewMinusConstant() {
        let constraints = view1[.edges] == view2[.edges] - 5
        XCTAssertEqual([
            NSLayoutConstraint(view1, .left, .equal, view2, .left, 1, 5),
            NSLayoutConstraint(view1, .right, .equal, view2, .right, 1, -5),
            NSLayoutConstraint(view1, .top, .equal, view2, .top, 1, 5),
            NSLayoutConstraint(view1, .bottom, .equal, view2, .bottom, 1, -5)], constraints)
    }

    func testDeclareEdgesOfViewEqualToEdgesOfAnotherViewPlusConstantTuple() {
        let constraints = view1[.edges] == view2[.edges] + (5, 10, 15, 20)
        XCTAssertEqual([
            NSLayoutConstraint(view1, .left, .equal, view2, .left, 1, 10),
            NSLayoutConstraint(view1, .right, .equal, view2, .right, 1, 20),
            NSLayoutConstraint(view1, .top, .equal, view2, .top, 1, 5),
            NSLayoutConstraint(view1, .bottom, .equal, view2, .bottom, 1, 15)], constraints)
    }

    func testDeclareEdgesOfViewEqualToEdgesOfAnotherViewMinusConstantTuple() {
        let constraints = view1[.edges] == view2[.edges] - (5, 10, 15, 20)
        XCTAssertEqual([
            NSLayoutConstraint(view1, .left, .equal, view2, .left, 1, -10),
            NSLayoutConstraint(view1, .right, .equal, view2, .right, 1, -20),
            NSLayoutConstraint(view1, .top, .equal, view2, .top, 1, -5),
            NSLayoutConstraint(view1, .bottom, .equal, view2, .bottom, 1, -15)], constraints)
    }

    // MARK: Relative to view with multiplier

    func testDeclareEdgesOfViewEqualToEdgesOfAnotherViewMultipliedByConstant() {
        let constraints = view1[.edges] == view2[.edges] * 1.2
        XCTAssertEqual([
            NSLayoutConstraint(view1, .left, .equal, view2, .left, 1.2, 0),
            NSLayoutConstraint(view1, .right, .equal, view2, .right, 1.2, 0),
            NSLayoutConstraint(view1, .top, .equal, view2, .top, 1.2, 0),
            NSLayoutConstraint(view1, .bottom, .equal, view2, .bottom, 1.2, 0)], constraints)
    }

    func testDeclareEdgesOfViewEqualToEdgesOfAnotherViewDividedByConstant() {
        let constraints = view1[.edges] == view2[.edges] / 1.25
        XCTAssertEqual([
            NSLayoutConstraint(view1, .left, .equal, view2, .left, 0.8, 0),
            NSLayoutConstraint(view1, .right, .equal, view2, .right, 0.8, 0),
            NSLayoutConstraint(view1, .top, .equal, view2, .top, 0.8, 0),
            NSLayoutConstraint(view1, .bottom, .equal, view2, .bottom, 0.8, 0)], constraints)
    }
}
