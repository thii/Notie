import UIKit

@available(iOS 8.0, *)
public typealias NotieAction = (() -> ())

let messageViewHeight: CGFloat = 80
let buttonHeight: CGFloat = 44
let notieViewHeight = messageViewHeight + buttonHeight

@available(iOS 8.0, *)
public class Notie : UIView {

    public var view: UIView

    public var title: String?

    public var message: String?

    public var style: NotieStyle = .Confirm
    
    public var leftButtonAction: NotieAction?

    public var rightButtonAction: NotieAction?

    public var placeholder: String?

    public var animationDuration: NSTimeInterval = 0.4

    public init(view: UIView, title: String?, message: String?, style: NotieStyle) {
        self.view = view
        self.title = title
        self.message = message
        self.style = style

        let height = self.style == .Input ? notieViewHeight + buttonHeight : notieViewHeight
        super.init(frame: CGRect(x: 0, y: -notieViewHeight, width: screenWidth, height: height))

        self.configureMesasgeView()

        if self.style == .Input {
            self.configureInputField()
        }

        self.configureLeftButton()
        self.configureRightButton()
}

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Action

    public func show() {
        self.view.addSubview(self)

        UIView.animateWithDuration(self.animationDuration) { () -> Void in
            self.centerY += notieViewHeight
        }
    }

    public func dismiss() {
        UIView.animateWithDuration(self.animationDuration, animations: { () -> Void in
            self.centerY -= notieViewHeight
            }) { (_) -> Void in
                self.removeFromSuperview()
        }
    }
    
    // MARK: Helpers

    private func configureMesasgeView() {
        self.backgroundColor = UIColor(red: 88.0 / 255.0, green: 135.0 / 255.0, blue: 207.0 / 255.0, alpha: 1.0)
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: screenWidth, height: messageViewHeight))
        messageLabel.centerX = self.centerX
        messageLabel.centerY = messageLabel.centerY + screenStatusBarHeight / 2
        messageLabel.text = self.message
        messageLabel.textAlignment = .Center
        messageLabel.textColor = UIColor.whiteColor()
        self.addSubview(messageLabel)
    }

    private func configureInputField() {
        let inputField = UITextField(frame: CGRect(x: 0, y: messageViewHeight, width: screenWidth, height: buttonHeight))
        inputField.backgroundColor = UIColor.whiteColor()
        inputField.textAlignment = .Center
        inputField.textColor = UIColor.lightGrayColor()
        inputField.placeholder = self.placeholder
        inputField.becomeFirstResponder()
        self.addSubview(inputField)
    }

    private func configureLeftButton(title: String? = "OK") {
        let y = self.style == .Input ? messageViewHeight + buttonHeight : messageViewHeight
        let button = UIButton(frame: CGRect(x: 0, y: y, width: screenWidth / 2, height: buttonHeight))
        button.backgroundColor = UIColor(red: 117.0 / 255.0, green: 183.0 / 255.0, blue: 96.0 / 255.0, alpha: 1.0)
        button.setTitle(title, forState: .Normal)
        button.addTarget(self, action: "leftButtonDidTap", forControlEvents: .TouchUpInside)
        self.addSubview(button)
    }

    private func configureRightButton(title: String? = "Cancel") {
        let y = self.style == .Input ? messageViewHeight + buttonHeight : messageViewHeight
        let button = UIButton(frame: CGRect(x: screenWidth / 2, y: y, width: screenWidth / 2, height: buttonHeight))
        button.backgroundColor = UIColor(red: 210.0 / 255.0, green: 120.0 / 255.0, blue: 102.0 / 255.0, alpha: 1.0)
        button.setTitle(title, forState: .Normal)
        button.addTarget(self, action: "rightButtonDidTap", forControlEvents: .TouchUpInside)
        self.addSubview(button)
    }

    // MARK: Button Handlers

    func leftButtonDidTap() {
        if self.leftButtonAction != nil {
            self.leftButtonAction!()
        }
    }

    func rightButtonDidTap() {
        if self.rightButtonAction != nil {
            self.rightButtonAction!()
        }
    }
}
