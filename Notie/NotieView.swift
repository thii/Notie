import EZSwiftExtensions
import SwiftColors
import UIKit

public class NotieView: UIView {
    public var message: String = ""
    public var leftButtonTitle: String = "Yes"
    public var rightButtonTitle: String = "No"

    public init(message: String, leftButtonTitle: String?, rightButtonTitle: String?) {
        super.init(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 80))
        self.message = message

        if leftButtonTitle != nil {
            self.leftButtonTitle = leftButtonTitle!
        }

        if rightButtonTitle != nil {
            self.rightButtonTitle = rightButtonTitle!
        }

        self.configureView()
    }

    func configureView() {
        self.backgroundColor = UIColor(hexString: "#5887cf")
        let frame = self.frame
        let messageLabel = UILabel(frame: frame)
        messageLabel.centerX = self.centerX
        messageLabel.centerY = messageLabel.centerY + screenStatusBarHeight / 2
        messageLabel.text = self.message
        messageLabel.textAlignment = .Center
        messageLabel.textColor = UIColor.whiteColor()
        self.addSubview(messageLabel)

    }

    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
}
