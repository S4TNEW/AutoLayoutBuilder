import UIKit

class AspectRatioExpression: Expression {}

extension AspectRatioExpression: ConstrainableToValue {

    func constrainToValue(_ value: CGFloat, relation: NSLayoutRelation) -> [NSLayoutConstraint] {
        return views.map { NSLayoutConstraint($0, .width, relation, $0, .height, value, 0) }
    }
}
