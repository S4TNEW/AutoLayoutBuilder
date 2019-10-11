import UIKit

extension NSLayoutConstraint {

    convenience init(_ view1: AnyObject, _ attr1: NSLayoutConstraint.Attribute, _ relation: NSLayoutConstraint.Relation, _ view2: AnyObject?, _ attr2: NSLayoutConstraint.Attribute, _ multiplier: CGFloat, _ c: CGFloat) {
        self.init(item: view1, attribute: attr1, relatedBy: relation, toItem: view2, attribute: attr2, multiplier: multiplier, constant: c)
    }
}

public func activate(_ constraints: [NSLayoutConstraint]) {

    for constraint in constraints {
        constraint.isActive = true
    }
}

public struct LayoutGuide {
    let layoutGuide: UILayoutSupport
}
