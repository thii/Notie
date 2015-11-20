import EZSwiftExtensions
import SwiftColors
import UIKit

public class NotieView: UIView {
    public var message: String = ""
    public var leftButtonTitle: String = "Yes"
    public var rightButtonTitle: String = "No"

    public var leftButtonBlock: (() -> ())?
    public var rightButtonBlock: (() -> ())?

    public init(message: String, leftButtonTitle: String?, rightButtonTitle: String?) {
        super.init(frame: CGRect(x: 0, y: -notieViewHeight, width: screenWidth, height: notieViewHeight))
        self.message = message

        if leftButtonTitle != nil {
            self.leftButtonTitle = leftButtonTitle!
        }

        if rightButtonTitle != nil {
            self.rightButtonTitle = rightButtonTitle!
        }

        self.configureView()
        self.configureLeftButton(leftButtonTitle)
        self.configureRightButton(rightButtonTitle)
    }

    func configureView() {
        self.backgroundColor = UIColor(hexString: "#5887cf")
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: screenWidth, height: messageViewHeight))
        messageLabel.centerX = self.centerX
        messageLabel.centerY = messageLabel.centerY + screenStatusBarHeight / 2
        messageLabel.text = self.message
        messageLabel.textAlignment = .Center
        messageLabel.textColor = UIColor.whiteColor()
        self.addSubview(messageLabel)
    }

    func configureLeftButton(title: String?) {
        let button = UIButton(frame: CGRect(x: 0, y: messageViewHeight, width: screenWidth / 2, height: buttonHeight))
        button.backgroundColor = UIColor(hexString: "#75b760")
        button.setTitle(title, forState: .Normal)
        button.addTarget(self, action: "leftButtonDidTap", forControlEvents: .TouchUpInside)
        self.addSubview(button)
    }

    func configureRightButton(title: String?) {
        let button = UIButton(frame: CGRect(x: screenWidth / 2, y: messageViewHeight, width: screenWidth / 2, height: buttonHeight))
        button.backgroundColor = UIColor(hexString: "#d27866")
        button.setTitle(title, forState: .Normal)
        button.addTarget(self, action: "rightButtonDidTap", forControlEvents: .TouchUpInside)
        self.addSubview(button)
    }

    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }

    // MARK: Button Handlers

    func leftButtonDidTap() {
        if self.leftButtonBlock != nil {
            self.leftButtonBlock!()
        }
    }

    func rightButtonDidTap() {
        if self.rightButtonBlock != nil {
            self.rightButtonBlock!()
        }
    }
}
