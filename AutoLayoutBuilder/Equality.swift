import UIKit

public func equalHeights(_ views: UIView...) -> [NSLayoutConstraint] {
    return equalHeights(views)
}

public func equalHeights(_ views: [UIView]) -> [NSLayoutConstraint] {
    let firstView = views.first!
    var constraints = [NSLayoutConstraint]()
    for view in views[1..<views.count] {
        constraints.append(NSLayoutConstraint(item: firstView, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 1, constant: 0))
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
        constraints.append(NSLayoutConstraint(item: firstView, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 1, constant: 0))
    }
    return constraints
}
