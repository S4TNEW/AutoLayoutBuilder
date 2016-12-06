import UIKit
import XCTest
@testable import AutoLayoutBuilder

class AspectRatioTests: ALBTestCase {

    let ratio: CGFloat = 16/9

    // MARK: Relative to ratio

    func testDeclareAspectRatioOfViewEqualToConstantRatio() {
        let constraints = view1[.aspectRatio] == ratio
        XCTAssertEqual(NSLayoutConstraint(view1, .width, .equal, view1, .height, ratio, 0), constraints[0])
    }

    func testDeclareAspectRatioOfMultipleViewsEqualToConstantRatio() {
        let constraints = Group(view1, view2)[.aspectRatio] == ratio
        XCTAssertEqual(NSLayoutConstraint(view1, .width, .equal, view1, .height, ratio, 0), constraints[0])
        XCTAssertEqual(NSLayoutConstraint(view2, .width, .equal, view2, .height, ratio, 0), constraints[1])
    }
}
