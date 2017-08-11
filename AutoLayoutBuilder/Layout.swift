import UIKit

open class LayoutGroup {
    var constraints = [NSLayoutConstraint]()

    open func activateConstraints(_ active: Bool) {
        for constraint in constraints {
            constraint.isActive = active
        }
    }
}

public func += (lhs: LayoutGroup, rhs: [NSLayoutConstraint]) {
    lhs.constraints += rhs
}

open class Layout {
    var keyedBuilders = ["" : LayoutGroup()]
    public init() {}
}

public extension Layout {

    subscript (key: String) -> LayoutGroup {
        return self.key(key)
    }

    public func key(_ key: String) -> LayoutGroup {
        if let builderGroup = keyedBuilders[key] {
            return builderGroup
        }
        else {
            let builderGroup = LayoutGroup()
            keyedBuilders[key] = builderGroup
            return builderGroup
        }
    }
}

public extension Layout {

    public func activateConstraints(_ active: Bool) {
        for builderGroup in keyedBuilders {
            builderGroup.1.activateConstraints(active)
        }
    }

    public func activateConstraintsExcludingKeys(_ keys: String...) {
        for (key, builderGroup) in keyedBuilders {
            if !keys.contains(key) {
                builderGroup.activateConstraints(true)
            }
        }
    }

    public func activateConstraintsWithKeys(_ keys: String...) {
        for (key, builderGroup) in keyedBuilders {
            if keys.contains(key) {
                builderGroup.activateConstraints(true)
            }
        }
    }
}

public func += (lhs: Layout, rhs: [NSLayoutConstraint]) {
    lhs.keyedBuilders[""]! += rhs
}
