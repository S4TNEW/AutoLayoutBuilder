import UIKit

open class DimensionExpression: SingleExpression {

    let attribute: DimensionAttribute

    init(attribute: DimensionAttribute, views: [UIView]) {
        self.attribute = attribute
        super.init(views: views)
    }
}

extension DimensionExpression: ConstrainableToValue {

    public func constrainToValue(_ value: CGFloat, relation: NSLayoutConstraint.Relation) -> [NSLayoutConstraint] {
        return views.map {
            NSLayoutConstraint(item: $0, attribute: self.attribute.raw, relatedBy: relation, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: value)
        }
    }
}

extension DimensionExpression: ConstrainableToExpression {

    public typealias This = DimensionExpression

    public func constrainToExpression(_ expression: DimensionExpression, relation: NSLayoutConstraint.Relation) -> [NSLayoutConstraint] {
        return views.map {
            NSLayoutConstraint(item: $0, attribute: self.attribute.raw, relatedBy: relation, toItem: expression.views.first!, attribute: expression.attribute.raw, multiplier: expression.multiplier, constant: expression.constant)
        }
    }
}
