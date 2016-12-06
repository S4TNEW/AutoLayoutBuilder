import UIKit

open class SizeExpression: DualExpression { }

extension SizeExpression: ConstrainableToSize {

    public func constrainToSize(_ size: CGSize) -> [NSLayoutConstraint] {
        return views.flatMap { [
            NSLayoutConstraint($0, .width, .equal, nil, .notAnAttribute, 1, size.width),
            NSLayoutConstraint($0, .height, .equal, nil, .notAnAttribute, 1, size.height)
            ]
        }
    }
}

extension SizeExpression: ConstrainableToExpression {

    public typealias This = SizeExpression
    
    public func constrainToExpression(_ expression: SizeExpression, relation: NSLayoutRelation) -> [NSLayoutConstraint] {
        return views.flatMap { [
            NSLayoutConstraint($0, .width, relation, expression.views.first!, .width, expression.multiplier.0, expression.constant.0),
            NSLayoutConstraint($0, .height, relation, expression.views.first!, .height, expression.multiplier.1, expression.constant.1)
            ]
        }
    }
}
