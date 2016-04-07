import UIKit

/// A closure of action to be handled when the user tap one of the buttons.
@available(iOS 9.0, *)
public typealias NotieAction = Void -> Void

/// Notie is a dropdown notification view that presents above the main view controller.
@available(iOS 9.0, *)
public class Notie : UIView {

    // MARK: Properties

    /// The view that the notification will be displayed at top of it.
    public var view: UIView

    /// The message of the notification. Default to `nil`
    public var message: String?

    /// The style of the notification. `.Confirm` style includes message view and two confirm buttons. `.Input` style adds an extra input text field. Default to `.Confirm`.
    public var style: NotieStyle = .Confirm
    
    /// A block to call when the user taps on the left button.
    public var leftButtonAction: NotieAction?

    /// A block to call when the user taps on the right button.
    public var rightButtonAction: NotieAction?

    /// The title of the left button. Default to `OK`.
    public var leftButtonTitle: String = "OK"

    /// The title of the left button. Default to `Cancel`.
    public var rightButtonTitle: String = "Cancel"

    /// The placeholder of the input text field. Default to `nil`.
    public var placeholder: String?

    /// How long the slide down animation should last.
    public var animationDuration: NSTimeInterval = 0.4

    /// The background color of the message view.
    public var messageBackgroundColor = UIColor(red: 88.0 / 255.0, green: 135.0 / 255.0, blue: 207.0 / 255.0, alpha: 1.0)

    /// The text color of the message view. Default to white color.
    public var messageTextColor = UIColor.whiteColor()

    /// The background color of the input text field. Default to white color.
    public var inputFieldBackgroundColor = UIColor.whiteColor()

    /// The text color of the input text field. Default to dark gray.
    public var inputFieldTextColor = UIColor.darkGrayColor()

    /// The background color of the left button.
    public var leftButtonBackgroundColor = UIColor(red: 117.0 / 255.0, green: 183.0 / 255.0, blue: 96.0 / 255.0, alpha: 1.0)

    /// The text color of the left button. Default to white color.
    public var leftButtonTextColor = UIColor.whiteColor()

    /// The background color of the right button.
    public var rightButtonBackgroundColor = UIColor(red: 210.0 / 255.0, green: 120.0 / 255.0, blue: 102.0 / 255.0, alpha: 1.0)

    /// The text color of the right button. Default to white color.
    public var rightButtonTextColor = UIColor.whiteColor()
    
    public enum buttons: Int{
        case standard = 2
        case single = 1
    }

    public var buttonCount: buttons? = buttons.standard
    // MARK: Private Properties


    private let backgroundView = UIStackView()

    private let statusBarView = UIView()

    private let contentView = UIStackView()

    private let leftButton = UIButton()

    private let rightButton = UIButton()

    private var topConstraint: NSLayoutConstraint?

    private var bottomConstraint: NSLayoutConstraint?

    private var inputField: UITextField?

    // MARK: Life Cycle

    /// A Notie with the optional `message` and provided `style`, ready to be presented with `show()`.
    ///
    /// - parameter view: The view that the notification will be displayed on top of it.
    /// - parameter message: The message of the notification. Default to `nil`
    /// - parameter style: The style of the notification. `.Confirm` style includes message view and two confirm buttons. `.Input` style adds an extra input text field. Default to `.Confirm`.
    public init(view: UIView, message: String?, style: NotieStyle) {
        self.view = view
        self.message = message
        self.style = style

        super.init(frame: CGRectZero)
    }

    /// This is required for classes conform to NSCoding protocol. Just don't care about it.
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    public func getText() -> String{
        if self.style == .Input {
            if inputField != nil {
                return (inputField?.text)!
            }
        }else{
            return ""
        }
        return ""
    }
    // MARK: Action

    /// Shows the notification.
    public func show() {
        self.view.addSubview(self)
        self.backgroundColor = self.messageBackgroundColor
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraintEqualToAnchor(self.view.widthAnchor).active = true
        self.topConstraint = self.topAnchor.constraintEqualToAnchor(self.view.topAnchor)
        self.bottomConstraint = self.bottomAnchor.constraintEqualToAnchor(self.view.topAnchor)
        self.topConstraint?.active = false
        self.bottomConstraint?.active = true

        self.configureBackgroundView()
        self.forceUpdates()

        UIView.animateWithDuration(self.animationDuration) { () -> Void in
            self.bottomConstraint?.active = false
            self.topConstraint?.active = true
            self.forceUpdates()
        }
    }

    /// Dismisses the notification.
    public func dismiss() {
        UIView.animateWithDuration(self.animationDuration, animations: { () -> Void in
            self.topConstraint?.active = false
            self.bottomConstraint?.active = true
            self.forceUpdates()
            }) { (_) -> Void in
                self.removeFromSuperview()
        }
    }


    // MARK: Helpers

    private func forceUpdates() {
        setNeedsLayout()
        setNeedsUpdateConstraints()
        layoutIfNeeded()
        updateConstraintsIfNeeded()
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
        messageLabel.textColor = self.messageTextColor
        messageLabel.widthAnchor.constraintEqualToAnchor(self.contentView.widthAnchor).active = true
    }

    private func addInputFieldPadding() {
        let padding = UIView()
        self.contentView.addArrangedSubview(padding)
        padding.backgroundColor = self.inputFieldBackgroundColor
        padding.heightAnchor.constraintEqualToConstant(5).active = true
        padding.widthAnchor.constraintEqualToAnchor(self.contentView.widthAnchor).active = true
    }

    private func configureInputField() {
        let inputField = UITextField()
        self.contentView.addArrangedSubview(inputField)
        self.inputField = inputField
        inputField.backgroundColor = self.inputFieldBackgroundColor
        inputField.textColor = self.inputFieldTextColor
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
        leftButton.backgroundColor = self.leftButtonBackgroundColor
        leftButton.setTitleColor(self.leftButtonTextColor, forState: .Normal)
        leftButton.setTitle(self.leftButtonTitle, forState: .Normal)
        leftButton.addTarget(self, action: #selector(Notie.leftButtonDidTap), forControlEvents: .TouchUpInside)
        buttonStack.addArrangedSubview(leftButton)

        let rightButton = UIButton()
        rightButton.backgroundColor = self.rightButtonBackgroundColor
        leftButton.setTitleColor(self.rightButtonTextColor, forState: .Normal)
        rightButton.setTitle(self.rightButtonTitle, forState: .Normal)
        rightButton.addTarget(self, action: #selector(Notie.rightButtonDidTap), forControlEvents: .TouchUpInside)
        if self.buttonCount != buttons.single {
             buttonStack.addArrangedSubview(rightButton)
        }

    }


    // MARK: Button Handlers

    func leftButtonDidTap() {
        guard let action = self.leftButtonAction else { return }
        action()
    }

    func rightButtonDidTap() {
        guard let action = self.rightButtonAction else { return }
        action()
    }
}
