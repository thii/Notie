import UIKit

public class Notie: NSObject {
    public static let sharedNotie = Notie()

    public func show(view: UIView, message: String, leftButtonTitle: String?, rightButtonTitle: String?) {
        let notieView = NotieView(message: message, leftButtonTitle: leftButtonTitle, rightButtonTitle: rightButtonTitle)
        view.addSubview(notieView)

        UIView.animateWithDuration(0.03) { () -> Void in
            notieView.centerY += 124
        }
    }

}
