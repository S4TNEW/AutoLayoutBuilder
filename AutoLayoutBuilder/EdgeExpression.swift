import UIKit

open class EdgeExpression: Expression {

    var constant: CGFloatQuad = (0, 0, 0, 0)
    var multiplier: CGFloatQuad = (1, 1, 1, 1)
}

extension EdgeExpression: MultiplierSingleExpression {

    public func setMultiplier(_ multiplier: CGFloat) {
        self.multiplier = (multiplier, multiplier, multiplier, multiplier)
    }
}

extension EdgeExpression: ConstantSingleExpression {

    public func setConstant(_ constant: CGFloat) {
        self.constant = (-constant, -constant, constant, constant)
    }
}

extension EdgeExpression: ConstantQuadExpression {

    public func setConstant(_ constant: CGFloatQuad) {
        self.constant = constant
    }
}

extension EdgeExpression: ConstrainableToExpression {

    public typealias This = EdgeExpression

    public func constrainToExpression(_ expression: EdgeExpression, relation: NSLayoutConstraint.Relation) -> [NSLayoutConstraint] {
        return views.flatMap { [
            NSLayoutConstraint($0, .left, relation, expression.views.first!, .left, expression.multiplier.1, expression.constant.1),
            NSLayoutConstraint($0, .right, relation, expression.views.first!, .right, expression.multiplier.3, expression.constant.3),
            NSLayoutConstraint($0, .top, relation, expression.views.first!, .top, expression.multiplier.0, expression.constant.0),
            NSLayoutConstraint($0, .bottom, relation, expression.views.first!, .bottom, expression.multiplier.2, expression.constant.2)
            ]
        }
    }
}
