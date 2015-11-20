import UIKit

let messageViewHeight: CGFloat = 80
let buttonHeight: CGFloat = 44
let notieViewHeight = messageViewHeight + buttonHeight

public class Notie: NSObject {
    public static let sharedNotie = Notie()
    public var currentNotieView: NotieView?
    public var animationDuration: NSTimeInterval = 0.4

    public func show(view: UIView, message: String, withInputField: Bool, placeholder: String?, leftButtonTitle: String?, rightButtonTitle: String?, leftButtonBlock: (() -> ())? = nil, rightButtonBlock: (() -> ())? = nil) {
        self.currentNotieView = NotieView(message: message, withInputField: withInputField, placeholder: placeholder, leftButtonTitle: leftButtonTitle, rightButtonTitle: rightButtonTitle)
        self.currentNotieView!.leftButtonBlock = leftButtonBlock
        self.currentNotieView!.rightButtonBlock = rightButtonBlock
        view.addSubview(self.currentNotieView!)

        UIView.animateWithDuration(animationDuration) { () -> Void in
            self.currentNotieView!.centerY += notieViewHeight
        }
    }

    public func dismiss() {
        UIView.animateWithDuration(animationDuration, animations: { () -> Void in
            self.currentNotieView!.centerY -= notieViewHeight
            }) { (_) -> Void in
                self.currentNotieView?.removeFromSuperview()
        }
    }
}
