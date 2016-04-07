import UIKit

/// The preferred style of the notification.
@available(iOS 9.0, *)
public enum NotieStyle : Int {

    /// The notification will include a message view and two confirm buttons.
    case Confirm

    /// The notification will include a message view, an input text field and two confirm buttons.
    case Input

}
