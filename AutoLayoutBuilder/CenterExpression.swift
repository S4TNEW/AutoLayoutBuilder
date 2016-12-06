import UIKit

open class CenterExpression: DualExpression { }

extension CenterExpression: ConstrainableToExpression {

    public typealias This = CenterExpression

    public func constrainToExpression(_ expression: CenterExpression, relation: NSLayoutRelation) -> [NSLayoutConstraint] {
        return views.flatMap { [
            NSLayoutConstraint($0, .centerX, relation, expression.views.first!, .centerX, expression.multiplier.0, expression.constant.0),
            NSLayoutConstraint($0, .centerY, relation, expression.views.first!, .centerY, expression.multiplier.1, expression.constant.1)
            ]
        }
    }
}
