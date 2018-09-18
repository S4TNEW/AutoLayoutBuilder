import UIKit

// MARK: Horizontal
public enum HorizontalAttribute {

    case centerX
    case left
    case right
    case leading
    case trailing

    case centerXWithinMargins
    case leftMargin
    case rightMargin
    case leadingMargin
    case trailingMargin
}

// MARK: Vertical
public enum VerticalAttribute {

    case centerY
    case top
    case bottom
    case baseline
    case firstBaseline

    case centerYWithinMargins
    case topMargin
    case bottomMargin
}

// MARK: Center
public enum CenterAttribute {
    case center
}

// MARK: Edge
public enum EdgeAttribute {
    case edges
}

// MARK: Dimension
public enum DimensionAttribute {
    case width
    case height
}

// MARK: Size
public enum SizeAttribute {
    case size
}

// MARK: Aspect Ratio
public enum AspectRatioAttribute {
    case aspectRatio
}

// Extensions:

extension HorizontalAttribute {
    var raw: NSLayoutConstraint.Attribute {
        switch self {
        case .centerX: return .centerX
        case .left: return .left
        case .right: return .right
        case .leading: return .leading
        case .trailing: return .trailing
        case .centerXWithinMargins: return .centerXWithinMargins
        case .leftMargin: return .leftMargin
        case .rightMargin: return .rightMargin
        case .leadingMargin: return .leadingMargin
        case .trailingMargin: return .trailingMargin
        }
    }
}

extension VerticalAttribute {
    var raw: NSLayoutConstraint.Attribute {
        switch self {
        case .centerY: return .centerY
        case .top: return .top
        case .bottom: return .bottom
        case .baseline: return .lastBaseline
        case .firstBaseline: return .firstBaseline
        case .centerYWithinMargins: return .centerYWithinMargins
        case .topMargin: return .topMargin
        case .bottomMargin: return .bottomMargin
        }
    }
}

extension DimensionAttribute {
    var raw: NSLayoutConstraint.Attribute {
        switch self {
        case .width: return .width
        case .height: return .height
        }
    }
}
