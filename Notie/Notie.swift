import UIKit

@available(iOS 9.0, *)
public typealias NotieAction = (() -> ())

let notieViewHeight: CGFloat = 124

@available(iOS 9.0, *)
public class Notie : UIStackView {

    // MARK: Properties

    public var view: UIView

    public var title: String?

    public var message: String?

    public var style: NotieStyle = .Confirm
    
    public var leftButtonAction: NotieAction?

    public var rightButtonAction: NotieAction?

    public var leftButtonTitle: String = "OK"

    public var rightButtonTitle: String = "Cancel"

    public var placeholder: String?

    public var animationDuration: NSTimeInterval = 0.4

    public let backgroundView = UIStackView()

    public let statusBarView = UIView()

    public let contentView = UIStackView()

    public let buttonsContainerView = UIView()

    public let leftButton = UIButton()

    public let rightButton = UIButton()

    // MARK: Life Cycle

    public init(view: UIView, title: String?, message: String?, style: NotieStyle) {
        self.view = view
        self.title = title
        self.message = message
        self.style = style

        super.init(frame: CGRectZero)
        self.initSubviews()
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    // MARK: Action

    public func show() {
        self.view.addSubview(self)
        self.widthAnchor.constraintEqualToAnchor(self.view.widthAnchor).active = true

        UIView.animateWithDuration(self.animationDuration) { () -> Void in
            self.centerY += notieViewHeight
        }
    }

    func updates() {
        setNeedsLayout()
        setNeedsUpdateConstraints()
        layoutIfNeeded()
        updateConstraintsIfNeeded()
    }

    public func dismiss() {
        UIView.animateWithDuration(self.animationDuration, animations: { () -> Void in
            self.centerY -= self.frame.height
            }) { (_) -> Void in
                self.removeFromSuperview()
        }
    }
    

    // MARK: Configure Subviews

    private func initSubviews() {
        // Configure Stack View's Layout
        self.translatesAutoresizingMaskIntoConstraints = false
        self.alignment = .Top
        self.axis = .Vertical
        self.distribution = .FillProportionally
        self.spacing = 0

        self.configureBackgroundView()
        self.configureStatusBarView()
        self.configureContentView()
        self.configureMesasgeView()

        if self.style == .Input {
            self.configureInputField()
        }

        self.configureButtons()
    }
    
    private func configureBackgroundView() {
        self.addArrangedSubview(self.backgroundView)
        self.backgroundView.backgroundColor = UIColor(red: 88.0 / 255.0, green: 135.0 / 255.0, blue: 207.0 / 255.0, alpha: 1.0)
        self.backgroundView.widthAnchor.constraintEqualToAnchor(self.widthAnchor).active = true
        self.backgroundView.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundView.alignment = .Top
        self.backgroundView.axis = .Vertical
        self.backgroundView.distribution = .Fill
        self.backgroundView.spacing = 0
    }

    private func configureStatusBarView() {
        self.backgroundView.addArrangedSubview(self.statusBarView)
        self.statusBarView.heightAnchor.constraintEqualToConstant(20).active = true
        self.statusBarView.backgroundColor = UIColor(red: 88.0 / 255.0, green: 135.0 / 255.0, blue: 207.0 / 255.0, alpha: 1.0)
        self.statusBarView.widthAnchor.constraintEqualToAnchor(self.backgroundView.widthAnchor).active = true
    }

    private func configureContentView() {
        self.backgroundView.addArrangedSubview(self.contentView)
        self.contentView.backgroundColor = UIColor.clearColor()
        self.contentView.widthAnchor.constraintEqualToAnchor(self.backgroundView.widthAnchor).active = true
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.alignment = .Top
        self.contentView.axis = .Vertical
        self.contentView.distribution = .FillProportionally
        self.contentView.spacing = 0
    }

    private func configureMesasgeView() {
        let messageLabel = UILabel()
        self.contentView.addArrangedSubview(messageLabel)

        messageLabel.backgroundColor = UIColor(red: 88.0 / 255.0, green: 135.0 / 255.0, blue: 207.0 / 255.0, alpha: 1.0)
        messageLabel.numberOfLines = 0
        messageLabel.text = self.message
        messageLabel.textAlignment = .Center
        messageLabel.textColor = UIColor.whiteColor()
        messageLabel.widthAnchor.constraintEqualToAnchor(self.contentView.widthAnchor).active = true
    }

    private func configureInputField() {
        let inputField = UITextField()
        self.contentView.addArrangedSubview(inputField)

        inputField.backgroundColor = UIColor.whiteColor()
        inputField.textAlignment = .Center
        inputField.textColor = UIColor.lightGrayColor()
        inputField.placeholder = self.placeholder
        inputField.becomeFirstResponder()
        inputField.widthAnchor.constraintEqualToAnchor(self.contentView.widthAnchor).active = true
    }

    private func configureButtons() {
        let buttonStack = UIStackView()
        self.contentView.addArrangedSubview(buttonStack)
        buttonStack.widthAnchor.constraintEqualToAnchor(self.contentView.widthAnchor).active = true

        buttonStack.axis = .Horizontal
        buttonStack.distribution = .FillEqually
        buttonStack.alignment = .Center
        buttonStack.spacing = 0
        buttonStack.translatesAutoresizingMaskIntoConstraints = false

        let leftButton = UIButton()
        leftButton.backgroundColor = UIColor(red: 117.0 / 255.0, green: 183.0 / 255.0, blue: 96.0 / 255.0, alpha: 1.0)
        leftButton.setTitle(self.leftButtonTitle, forState: .Normal)
        leftButton.addTarget(self, action: "leftButtonDidTap", forControlEvents: .TouchUpInside)
        buttonStack.addArrangedSubview(leftButton)

        let rightButton = UIButton()
        rightButton.backgroundColor = UIColor(red: 210.0 / 255.0, green: 120.0 / 255.0, blue: 102.0 / 255.0, alpha: 1.0)
        rightButton.setTitle(self.rightButtonTitle, forState: .Normal)
        rightButton.addTarget(self, action: "rightButtonDidTap", forControlEvents: .TouchUpInside)
        buttonStack.addArrangedSubview(rightButton)
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
