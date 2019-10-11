import UIKit

open class HorizontalExpression: SingleExpression {

    let attribute: HorizontalAttribute

    init(attribute: HorizontalAttribute, views: [UIView]) {
        self.attribute = attribute
        super.init(views: views)
    }
}

extension HorizontalExpression: ConstrainableToExpression {

    public typealias This = HorizontalExpression

    public func constrainToExpression(_ expression: HorizontalExpression, relation: NSLayoutConstraint.Relation) -> [NSLayoutConstraint] {
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
