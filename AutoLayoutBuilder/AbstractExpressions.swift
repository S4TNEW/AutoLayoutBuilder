import UIKit

open class Expression {

    open var views: [UIView]

    init(views: [UIView]) {
        self.views = views
    }
}

// MARK: Single

open class SingleExpression: Expression {

    open var multiplier: CGFloat = 1
    open var constant: CGFloat = 0
}

extension SingleExpression: ConstantSingleExpression {

    public func setConstant(_ constant: CGFloat) {
        self.constant = constant
    }
}

extension SingleExpression: MultiplierSingleExpression {

    public func setMultiplier(_ multiplier: CGFloat) {
        self.multiplier = multiplier
    }
}


// MARK: Dual

open class DualExpression: Expression {

    open var multiplier: CGFloatPair = (1, 1)
    open var constant: CGFloatPair = (0, 0)
}

extension DualExpression: MultiplierSingleExpression {

    public func setMultiplier(_ multiplier: CGFloat) {
        self.multiplier = (multiplier, multiplier)
    }
}

extension DualExpression: MultiplierTupleExpression {

    public func setMultiplier(_ multiplier: CGFloatPair) {
        self.multiplier = multiplier
    }
}

extension DualExpression: ConstantSingleExpression {

    public func setConstant(_ constant: CGFloat) {
        self.constant = (constant, constant)
    }
}

extension DualExpression: ConstantTupleExpression {

    public func setConstant(_ constant: CGFloatPair) {
        self.constant = constant
    }
}
