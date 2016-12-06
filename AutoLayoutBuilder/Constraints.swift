import UIKit

public typealias CGFloatPair = (CGFloat, CGFloat)
public typealias CGFloatQuad = (CGFloat, CGFloat, CGFloat, CGFloat)

// MARK: == CGFloat
public protocol ConstrainableToValue {
    func constrainToValue(_ value: CGFloat, relation: NSLayoutRelation) -> [NSLayoutConstraint]
}

public func ==(lhs: ConstrainableToValue, rhs: CGFloat) -> [NSLayoutConstraint] {
    return lhs.constrainToValue(rhs, relation: .equal)
}

public func >=(lhs: ConstrainableToValue, rhs: CGFloat) -> [NSLayoutConstraint] {
    return lhs.constrainToValue(rhs, relation: .greaterThanOrEqual)
}

public func <=(lhs: ConstrainableToValue, rhs: CGFloat) -> [NSLayoutConstraint] {
    return lhs.constrainToValue(rhs, relation: .lessThanOrEqual)
}

// MARK: == CGSize
public protocol ConstrainableToSize {
    func constrainToSize(_ size: CGSize) -> [NSLayoutConstraint]
}

public func ==(lhs: ConstrainableToSize, rhs: CGSize) -> [NSLayoutConstraint] {
    return lhs.constrainToSize(rhs)
}

// MARK: ==, >=, <= view[.Attribute]
public protocol ConstrainableToExpression {
    associatedtype This
    func constrainToExpression(_ Expression: This, relation: NSLayoutRelation) -> [NSLayoutConstraint]
}

public func ==<T1:ConstrainableToExpression, T2:ConstrainableToExpression>(lhs: T1, rhs: T2) -> [NSLayoutConstraint] where T1.This == T2 {
    return lhs.constrainToExpression(rhs, relation: .equal)
}

public func >=<T1:ConstrainableToExpression, T2:ConstrainableToExpression>(lhs: T1, rhs: T2) -> [NSLayoutConstraint] where T1.This == T2 {
    return lhs.constrainToExpression(rhs, relation: .greaterThanOrEqual)
}

public func <=<T1:ConstrainableToExpression, T2:ConstrainableToExpression>(lhs: T1, rhs: T2) -> [NSLayoutConstraint] where T1.This == T2 {
    return lhs.constrainToExpression(rhs, relation: .lessThanOrEqual)
}

//
// MARK:
//

// MARK: Constant Expression
public protocol ConstantSingleExpression: class {
    func setConstant(_ constant: CGFloat)
}

public func +<T: ConstantSingleExpression>(lhs: T, rhs: CGFloat) -> T {
    lhs.setConstant(rhs)
    return lhs
}

public func -<T: ConstantSingleExpression>(lhs: T, rhs: CGFloat) -> T {
    lhs.setConstant(-rhs)
    return lhs
}

// MARK: Constant Tuple Expression
public protocol ConstantTupleExpression: class {
    func setConstant(_ constant: CGFloatPair)
}

public func +<T: ConstantTupleExpression>(lhs: T, rhs: CGFloatPair) -> T {
    lhs.setConstant(rhs)
    return lhs
}

public func -<T: ConstantTupleExpression>(lhs: T, rhs: CGFloatPair) -> T {
    lhs.setConstant((-rhs.0, -rhs.1))
    return lhs
}

// MARK: Constant Tuple Expression
public protocol ConstantQuadExpression: class {
    func setConstant(_ constant: CGFloatQuad)
}

public func +<T: ConstantQuadExpression>(lhs: T, rhs: CGFloatQuad) -> T {
    lhs.setConstant(rhs)
    return lhs
}

public func -<T: ConstantQuadExpression>(lhs: T, rhs: CGFloatQuad) -> T {
    lhs.setConstant((-rhs.0, -rhs.1, -rhs.2, -rhs.3))
    return lhs
}

// MARK: Multiplier Expression
public protocol MultiplierSingleExpression {
    func setMultiplier(_ multiplier: CGFloat)
}

public func *<T: MultiplierSingleExpression>(lhs: T, rhs: CGFloat) -> T {
    lhs.setMultiplier(rhs)
    return lhs
}

public func /<T: MultiplierSingleExpression>(lhs: T, rhs: CGFloat) -> T {
    lhs.setMultiplier(1/rhs)
    return lhs
}

// MARK: Multiplier Tuple Expression
public protocol MultiplierTupleExpression {
    func setMultiplier(_ multiplier: CGFloatPair)
}

public func *<T: MultiplierTupleExpression>(lhs: T, rhs: CGFloatPair) -> T {
    lhs.setMultiplier(rhs)
    return lhs
}

public func /<T: MultiplierTupleExpression>(lhs: T, rhs: CGFloatPair) -> T {
    lhs.setMultiplier((1/rhs.0, 1/rhs.1))
    return lhs
}
