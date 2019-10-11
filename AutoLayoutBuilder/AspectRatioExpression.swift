import UIKit

class AspectRatioExpression: Expression {}

extension AspectRatioExpression: ConstrainableToValue {

    func constrainToValue(_ value: CGFloat, relation: NSLayoutConstraint.Relation) -> [NSLayoutConstraint] {
        return views.map { NSLayoutConstraint($0, .width, relation, $0, .height, value, 0) }
    }
}
