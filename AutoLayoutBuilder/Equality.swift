import UIKit

public func equalHeights(_ views: UIView...) -> [NSLayoutConstraint] {
    return equalHeights(views)
}

public func equalHeights(_ views: [UIView]) -> [NSLayoutConstraint] {
    let firstView = views.first!
    var constraints = [NSLayoutConstraint]()
    for view in views[1..<views.count] {
        constraints.append(NSLayoutConstraint(firstView, .height, .equal, view, .height, 1, 0))
    }
    return constraints
}

public func equalWidths(_ views: UIView...) -> [NSLayoutConstraint] {
    return equalWidths(views)
}

public func equalWidths(_ views: [UIView]) -> [NSLayoutConstraint] {
    let firstView = views.first!
    var constraints = [NSLayoutConstraint]()
    for view in views[1..<views.count] {
        constraints.append(NSLayoutConstraint(firstView, .width, .equal, view, .width, 1, 0))
    }
    return constraints
}
