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

    public func constrainToExpression(_ expression: VerticalExpression, relation: NSLayoutRelation) -> [NSLayoutConstraint] {
        return views.map {
            NSLayoutConstraint($0, self.attribute.raw, relation, expression.views.first!, expression.attribute.raw, expression.multiplier, expression.constant)
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

func makeVerticalPositionRelationConstraints(_ lhs: VerticalExpression, rhs: LayoutGuideExpression, relation: NSLayoutRelation) -> [NSLayoutConstraint] {
    return lhs.views.map { NSLayoutConstraint($0, lhs.attribute.raw, relation, rhs.layoutGuide, rhs.attribute.raw, 1, rhs.constant) }
}
