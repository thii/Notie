import EZSwiftExtensions
import SwiftColors
import UIKit

public class NotieView: UIView {
    public var message: String = ""
    public var withInputField: Bool = false
    public var placeholder: String?
    public var leftButtonTitle: String = "Yes"
    public var rightButtonTitle: String = "No"

    public var leftButtonBlock: (() -> ())?
    public var rightButtonBlock: (() -> ())?

    public init(message: String, withInputField: Bool, placeholder: String?, leftButtonTitle: String?, rightButtonTitle: String?) {
        let height = withInputField ? notieViewHeight + buttonHeight : notieViewHeight
        super.init(frame: CGRect(x: 0, y: -notieViewHeight, width: screenWidth, height: height))

        self.message = message
        self.withInputField = withInputField
        self.placeholder = placeholder

        self.configureMesasgeView()

        if withInputField == true {
            self.configureInputField()
        }

        if leftButtonTitle != nil {
            self.leftButtonTitle = leftButtonTitle!
        }

        if rightButtonTitle != nil {
            self.rightButtonTitle = rightButtonTitle!
        }

        self.configureLeftButton(leftButtonTitle)
        self.configureRightButton(rightButtonTitle)
    }

    func configureMesasgeView() {
        self.backgroundColor = UIColor(hexString: "#5887cf")
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: screenWidth, height: messageViewHeight))
        messageLabel.centerX = self.centerX
        messageLabel.centerY = messageLabel.centerY + screenStatusBarHeight / 2
        messageLabel.text = self.message
        messageLabel.textAlignment = .Center
        messageLabel.textColor = UIColor.whiteColor()
        self.addSubview(messageLabel)
    }

    func configureInputField() {
        let inputField = UITextField(frame: CGRect(x: 0, y: messageViewHeight, width: screenWidth, height: buttonHeight))
        inputField.backgroundColor = UIColor.whiteColor()
        inputField.textAlignment = .Center
        inputField.textColor = UIColor.lightGrayColor()
        inputField.placeholder = self.placeholder
        self.addSubview(inputField)
    }

    func configureLeftButton(title: String?) {
        let y = self.withInputField ? messageViewHeight + buttonHeight : messageViewHeight
        let button = UIButton(frame: CGRect(x: 0, y: y, width: screenWidth / 2, height: buttonHeight))
        button.backgroundColor = UIColor(hexString: "#75b760")
        button.setTitle(title, forState: .Normal)
        button.addTarget(self, action: "leftButtonDidTap", forControlEvents: .TouchUpInside)
        self.addSubview(button)
    }

    func configureRightButton(title: String?) {
        let y = self.withInputField ? messageViewHeight + buttonHeight : messageViewHeight
        let button = UIButton(frame: CGRect(x: screenWidth / 2, y: y, width: screenWidth / 2, height: buttonHeight))
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
