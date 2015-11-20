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
        super.init(frame: CGRect(x: 0, y: -124, width: screenWidth, height: 124))
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
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 80))
        messageLabel.centerX = self.centerX
        messageLabel.centerY = messageLabel.centerY + screenStatusBarHeight / 2
        messageLabel.text = self.message
        messageLabel.textAlignment = .Center
        messageLabel.textColor = UIColor.whiteColor()
        self.addSubview(messageLabel)
    }

    func configureLeftButton(title: String?) {
        let button = UIButton(frame: CGRect(x: 0, y: 80, width: screenWidth / 2, height: 44))
        button.backgroundColor = UIColor(hexString: "#75b760")
        button.setTitle(title, forState: .Normal)
        button.addTarget(self, action: "leftButtonDidTap", forControlEvents: .TouchUpInside)
        self.addSubview(button)
    }

    func configureRightButton(title: String?) {
        let button = UIButton(frame: CGRect(x: screenWidth / 2, y: 80, width: screenWidth / 2, height: 44))
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
        print("Left")
    }

    func rightButtonDidTap() {
        print("Right")
    }
}
