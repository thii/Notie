import UIKit

/// The `style` of the notification.
/// - Confirm: The notification will include a message view and two confirm buttons. 
/// - Input: The notification will include a message view, an input text field and two confirm buttons.
@available(iOS 9.0, *)
public enum NotieStyle : Int {

    case Confirm
    case Input
}
