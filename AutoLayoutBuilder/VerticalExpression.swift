import UIKit

open class VerticalExpression: SingleExpression {

    let attribute: VerticalAttribute

    init(attribute: VerticalAttribute, views: [UIView]) {
        self.attribute = attribute
        super.init(views: views)
    }
}

extension VerticalExpression: ConstrainableToExpression {

    public typealias This = VerticalExpression

    public func constrainToExpression(_ expression: VerticalExpression, relation: NSLayoutConstraint.Relation) -> [NSLayoutConstraint] {
        return views.map {
            NSLayoutConstraint(item: $0,
                               attribute: self.attribute.raw,
                               relatedBy: relation,
                               toItem: expression.views.first!,
                               attribute: expression.attribute.raw,
                               multiplier: expression.multiplier,
                               constant: expression.constant)
        }
    }
}

// MARK: Operators

public func ==(lhs: VerticalExpression, rhs: LayoutGuideExpression) -> [NSLayoutConstraint] {
    return makeVerticalPositionRelationConstraints(lhs, rhs: rhs, relation: .equal)
}

public func >=(lhs: VerticalExpression, rhs: LayoutGuideExpression) -> [NSLayoutConstraint] {
    return makeVerticalPositionRelationConstraints(lhs, rhs: rhs, relation: .greaterThanOrEqual)
}

public func <=(lhs: VerticalExpression, rhs: LayoutGuideExpression) -> [NSLayoutConstraint] {
    return makeVerticalPositionRelationConstraints(lhs, rhs: rhs, relation: .lessThanOrEqual)
}

// MARK: Internal

func makeVerticalPositionRelationConstraints(_ lhs: VerticalExpression, rhs: LayoutGuideExpression, relation: NSLayoutConstraint.Relation) -> [NSLayoutConstraint] {
    return lhs.views.map {
        NSLayoutConstraint(item: $0,
                           attribute: lhs.attribute.raw,
                           relatedBy: relation,
                           toItem: rhs.layoutGuide,
                           attribute: rhs.attribute.raw,
                           multiplier: 1,
                           constant: rhs.constant)

    }
}
