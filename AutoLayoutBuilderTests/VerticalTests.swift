import UIKit
import XCTest
@testable import AutoLayoutBuilder

class VerticalTests: ALBTestCase {

    // MARK: Relative to view

    func testDeclareTopOfViewEqualToBottomOfAnotherView() {
        constraints = view1[.top] == view2[.bottom]
        XCTAssertEqual([NSLayoutConstraint(view1, .top, .equal, view2, .bottom, 1, 0)], constraints!)
    }

    func testDeclareTopOfMultipleViewsEqualToBottomOfAnotherView() {
        constraints = Group(view1,view2)[.top] == view3[.bottom]
        XCTAssertEqual([
            NSLayoutConstraint(view1, .top, .equal, view3, .bottom, 1, 0),
            NSLayoutConstraint(view2, .top, .equal, view3, .bottom, 1, 0)], constraints!)
    }

    // MARK: Relative to layout guide

    func testDeclareTopOfViewEqualToTopOfTopLayoutGuide() {
        constraints = view1[.top] == viewController.layoutGuides.top[.top]
        XCTAssertEqual([NSLayoutConstraint(view1, .top, .equal, viewController.topLayoutGuide, .top, 1, 0)], constraints!)
    }

    func testDeclareBottomOfViewEqualToBottomOfBottomLayoutGuide() {
        constraints = view1[.bottom] == viewController.layoutGuides.bottom[.bottom]
        XCTAssertEqual([NSLayoutConstraint(view1, .bottom, .equal, viewController.bottomLayoutGuide, .bottom, 1, 0)], constraints!)
    }

    func testDeclareTopOfViewGreaterThanOrEqualToTopOfTopLayoutGuide() {
        constraints = view1[.top] >= viewController.layoutGuides.top[.top]
        XCTAssertEqual([NSLayoutConstraint(view1, .top, .greaterThanOrEqual, viewController.topLayoutGuide, .top, 1, 0)], constraints!)
    }

    func testDeclareTopOfViewLessThanOrEqualToTopOfTopLayoutGuide() {
        constraints = view1[.top] <= viewController.layoutGuides.top[.top]
        XCTAssertEqual([NSLayoutConstraint(view1, .top, .lessThanOrEqual, viewController.topLayoutGuide, .top, 1, 0)], constraints!)
    }

    // MARK: Relative to layout guide with constant

    func testDeclareTopOfViewEqualToBottomOfTopLayoutGuidePlusConstant() {
        constraints = view1[.top] == viewController.layoutGuides.top[.bottom] + 10
        XCTAssertEqual([NSLayoutConstraint(view1, .top, .equal, viewController.topLayoutGuide, .bottom, 1, 10)], constraints!)
    }

    func testDeclareTopOfViewEqualToBottomOfTopLayoutGuideMinusConstant() {
        constraints = view1[.top] == viewController.layoutGuides.top[.bottom] - 10
        XCTAssertEqual([NSLayoutConstraint(view1, .top, .equal, viewController.topLayoutGuide, .bottom, 1, -10)], constraints!)
    }
}
