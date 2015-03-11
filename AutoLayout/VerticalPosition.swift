//
//  Attributes.swift
//  AutoLayout
//
//  Created by Marc Baldwin on 10/03/2015.
//  Copyright (c) 2015 Marc Baldwin. All rights reserved.
//

import UIKit

public enum VerticalPositionAttribute {
    case Center
    case Top
    case Bottom
}

public struct VerticalPositionConstraint {
    let views: [UIView]
    let attribute: VerticalPositionAttribute
    let multiplier: CGFloat
    let constant: CGFloat
}

extension VerticalPositionConstraint {

    var trueAttribute: NSLayoutAttribute {
        switch attribute {
        case .Center: return .CenterY
        case .Top: return .Top
        case .Bottom: return .Bottom
        }
    }
}

// MARK: Operator Overloads

public func ===(lhs: VerticalPositionConstraint, rhs: VerticalPositionConstraint) -> [NSLayoutConstraint] {
    var constraints = [NSLayoutConstraint]()

    let constraint = NSLayoutConstraint(
        item: lhs.views.first!, attribute: lhs.trueAttribute,
        relatedBy: .Equal,
        toItem: rhs.views.first!, attribute: rhs.trueAttribute,
        multiplier: rhs.multiplier, constant: rhs.constant)

    constraints.append(constraint)
    return constraints
}

public func *(lhs: VerticalPositionConstraint, rhs: CGFloat) -> VerticalPositionConstraint {
    return VerticalPositionConstraint(views: lhs.views, attribute: lhs.attribute, multiplier: lhs.multiplier * rhs, constant: lhs.constant)
}

public func /(lhs: VerticalPositionConstraint, rhs: CGFloat) -> VerticalPositionConstraint {
    return lhs * (1/rhs)
}

public func +(lhs: VerticalPositionConstraint, rhs: CGFloat) -> VerticalPositionConstraint {
    return VerticalPositionConstraint(views: lhs.views, attribute: lhs.attribute, multiplier: lhs.multiplier, constant: lhs.constant + rhs)
}

public func -(lhs: VerticalPositionConstraint, rhs: CGFloat) -> VerticalPositionConstraint {
    return lhs + (-rhs)
}

// MARK: Extensions

public extension UIView {

    public func layout(verticalPosition: VerticalPositionAttribute) -> VerticalPositionConstraint {
        return VerticalPositionConstraint(views: [self], attribute: verticalPosition, multiplier: 1, constant: 0)
    }
}

public extension Views {

    public func layout(verticalPosition: VerticalPositionAttribute) -> VerticalPositionConstraint {
        return VerticalPositionConstraint(views: views, attribute: verticalPosition, multiplier: 1, constant: 0)
    }
}