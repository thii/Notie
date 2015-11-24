import UIKit

@available(iOS 9.0, *)
public typealias NotieAction = (() -> ())

let notieViewHeight: CGFloat = 124

@available(iOS 9.0, *)
public class Notie : UIView {

    // MARK: Properties

    public var view: UIView

    public var message: String?

    public var style: NotieStyle = .Confirm
    
    public var leftButtonAction: NotieAction?

    public var rightButtonAction: NotieAction?

    public var leftButtonTitle: String = "OK"

    public var rightButtonTitle: String = "Cancel"

    public var placeholder: String?

    public var animationDuration: NSTimeInterval = 0.4

    // MARK: Private Properties

    private let backgroundView = UIStackView()

    private let statusBarView = UIView()

    private let contentView = UIStackView()

    private let leftButton = UIButton()

    private let rightButton = UIButton()

    private var topConstraint: NSLayoutConstraint?

    private var bottomConstraint: NSLayoutConstraint?

    // MARK: Life Cycle

    public init(view: UIView, message: String?, style: NotieStyle) {
        self.view = view
        self.message = message
        self.style = style

        super.init(frame: CGRectZero)
        self.backgroundColor = UIColor(red: 88.0 / 255.0, green: 135.0 / 255.0, blue: 207.0 / 255.0, alpha: 1.0)
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    // MARK: Action

    public func show() {
        self.view.addSubview(self)
        self.configureBackgroundView()
        self.widthAnchor.constraintEqualToAnchor(self.view.widthAnchor).active = true
        self.topConstraint = self.topAnchor.constraintEqualToAnchor(self.view.topAnchor)
        self.bottomConstraint = self.bottomAnchor.constraintEqualToAnchor(self.view.topAnchor)
        self.topConstraint?.active = false
        self.bottomConstraint?.active = true
        forceUpdates()

        UIView.animateWithDuration(self.animationDuration) { () -> Void in
            self.bottomConstraint?.active = false
            self.topConstraint?.active = true
            self.forceUpdates()
        }
    }

    func forceUpdates() {
        setNeedsLayout()
        setNeedsUpdateConstraints()
        layoutIfNeeded()
        updateConstraintsIfNeeded()
    }

    public func dismiss() {
        UIView.animateWithDuration(self.animationDuration, animations: { () -> Void in
            self.topConstraint?.active = false
            self.bottomConstraint?.active = true
            self.forceUpdates()
            }) { (_) -> Void in
                self.removeFromSuperview()
        }
    }
    

    // MARK: Configure Subviews

    private func configureBackgroundView() {
        self.configureStatusBarView()
        self.configureContentView()
        self.addSubview(self.backgroundView)
        self.backgroundView.topAnchor.constraintEqualToAnchor(self.topAnchor).active = true
        self.backgroundView.bottomAnchor.constraintEqualToAnchor(self.bottomAnchor).active = true
        self.backgroundView.leftAnchor.constraintEqualToAnchor(self.leftAnchor).active = true
        self.backgroundView.rightAnchor.constraintEqualToAnchor(self.rightAnchor).active = true
        self.backgroundView.backgroundColor = UIColor(red: 88.0 / 255.0, green: 135.0 / 255.0, blue: 207.0 / 255.0, alpha: 1.0)
        self.backgroundView.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundView.alignment = .Top
        self.backgroundView.axis = .Vertical
        self.backgroundView.distribution = .Fill
        self.backgroundView.spacing = 0
    }

    private func configureStatusBarView() {
        self.backgroundView.addArrangedSubview(self.statusBarView)
        self.statusBarView.heightAnchor.constraintEqualToConstant(20).active = true
    }

    private func configureContentView() {
        self.configureMesasgeView()
        self.configureMessageLabelBottomPadding()
        if self.style == .Input {
            self.addInputFieldPadding()
            self.configureInputField()
            self.addInputFieldPadding()
        }
        self.configureButtons()

        self.backgroundView.addArrangedSubview(self.contentView)
        self.contentView.widthAnchor.constraintEqualToAnchor(self.backgroundView.widthAnchor).active = true
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.alignment = .Top
        self.contentView.axis = .Vertical
        self.contentView.distribution = .Fill
        self.contentView.spacing = 0
    }

    private func configureMessageLabelBottomPadding() {
        let padding = UIView()
        self.contentView.addArrangedSubview(padding)
        padding.heightAnchor.constraintEqualToConstant(5).active = true
        padding.widthAnchor.constraintEqualToAnchor(self.contentView.widthAnchor).active = true
    }

    private func configureMesasgeView() {
        let messageLabel = UILabel()
        self.contentView.addArrangedSubview(messageLabel)

        messageLabel.numberOfLines = 0
        messageLabel.text = self.message
        messageLabel.textAlignment = .Center
        messageLabel.textColor = UIColor.whiteColor()
        messageLabel.widthAnchor.constraintEqualToAnchor(self.contentView.widthAnchor).active = true
    }

    private func addInputFieldPadding() {
        let padding = UIView()
        self.contentView.addArrangedSubview(padding)
        padding.backgroundColor = .whiteColor()
        padding.heightAnchor.constraintEqualToConstant(5).active = true
        padding.widthAnchor.constraintEqualToAnchor(self.contentView.widthAnchor).active = true
    }

    private func configureInputField() {
        let inputField = UITextField()
        self.contentView.addArrangedSubview(inputField)

        inputField.backgroundColor = UIColor.whiteColor()
        inputField.textAlignment = .Center
        inputField.placeholder = self.placeholder
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
