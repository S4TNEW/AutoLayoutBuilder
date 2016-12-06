import UIKit

public enum LayoutDirection {

    case horizontal
    case leadingToTrailing

    case vertical
}

open class LayoutRelation {

    var views: [UIView]
    var margins: [CGFloat]

    public init(views: UIView...) {
        self.views = views
        self.margins = [0]
    }
}

// MARK: Operators

infix operator ~ { associativity left precedence 100 }

public func ~(lhs: LayoutDirection, rhs: LayoutRelation) -> [NSLayoutConstraint] {
    return makeLayoutConstraints(lhs, views: rhs.views, margins: rhs.margins)
}

public func ~(lhs: LayoutDirection, rhs: Group) -> [NSLayoutConstraint] {
    return makeLayoutConstraints(lhs, views: rhs.views, margins: nil)
}

public func |(lhs: UIView, rhs: UIView) -> LayoutRelation {
    return LayoutRelation(views: lhs, rhs)
}

public func |(lhs: LayoutRelation, rhs: UIView) -> LayoutRelation {
    lhs.views.append(rhs)
    if lhs.margins.count < lhs.views.count-1 {
        lhs.margins.append(0)
    }
    return lhs
}

public func |(lhs: LayoutRelation, rhs: CGFloat) -> LayoutRelation {
    lhs.margins.append(rhs)
    return lhs
}

public func |(lhs: UIView, rhs: CGFloat) -> LayoutRelation {
    let layoutRelation = LayoutRelation(views: lhs)
    layoutRelation.margins[layoutRelation.margins.count-1] = rhs
    return layoutRelation
}

// MARK: Internal

internal func makeLayoutConstraints(_ direction: LayoutDirection, views: [UIView], margins: [CGFloat]?) -> [NSLayoutConstraint] {
    let safeMargins = margins == nil ? Array<CGFloat>(repeating: 0, count: views.count) : margins!
    var constraints = [NSLayoutConstraint]()
    for i in 1 ..< views.count {
        switch direction {
        case .horizontal:
            constraints.append(NSLayoutConstraint(views[i], .left, .equal, views[i-1], .right, 1, safeMargins[i-1]))
        case .leadingToTrailing:
            constraints.append(NSLayoutConstraint(views[i], .leading, .equal, views[i-1], .trailing, 1, safeMargins[i-1]))
        case .vertical:
            constraints.append(NSLayoutConstraint(views[i], .top, .equal, views[i-1], .bottom, 1, safeMargins[i-1]))
        }
    }
    return constraints
}
