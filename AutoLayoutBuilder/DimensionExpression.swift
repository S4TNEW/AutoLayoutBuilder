import UIKit

open class DimensionExpression: SingleExpression {

    let attribute: DimensionAttribute

    init(attribute: DimensionAttribute, views: [UIView]) {
        self.attribute = attribute
        super.init(views: views)
    }
}

extension DimensionExpression: ConstrainableToValue {

    public func constrainToValue(_ value: CGFloat, relation: NSLayoutRelation) -> [NSLayoutConstraint] {
        return views.map {
            NSLayoutConstraint($0, self.attribute.raw, relation, nil, .notAnAttribute, 1, value)
        }
    }
}

extension DimensionExpression: ConstrainableToExpression {

    public typealias This = DimensionExpression

    public func constrainToExpression(_ expression: DimensionExpression, relation: NSLayoutRelation) -> [NSLayoutConstraint] {
        return views.map {
            NSLayoutConstraint($0, self.attribute.raw, relation, expression.views.first!, expression.attribute.raw, expression.multiplier, expression.constant)
        }
    }
}
