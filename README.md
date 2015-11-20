Notie
=====

Undistracted in-app notification in Swift, with added buttons and input box.

This library is still work in progress. Do not use it in production, yet.

## Installation

### CocoaPods

To integrate Notie into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

pod 'Notie', :git => 'git@github.com:thii/Notie.git'
```

Then, run the following command:

```bash
$ pod install
```

And add `import Notie` to the top of the files using Notie.

## Examples

### Show alert with confirm buttons

```swift
let notie = Notie.sharedNotie
notie.show(self.view, message: "Are you sure you want to do that?", withInputField: false, placeholder: nil, leftButtonTitle: "Yes", rightButtonTitle: "No", leftButtonBlock: { () -> () in
    // Left button handler
    }) { () -> () in
    // Right button handler
}
```

### Show alert with input field

```swift
let notie = Notie.sharedNotie
notie.show(self.view, message: "Please enter your email address", withInputField: true, placeholder: "email@example.com", leftButtonTitle: "Submit", rightButtonTitle: "Cancel", leftButtonBlock: { () -> () in
    // Submit button handler
    }) { () -> () in
    // Cancel button handler
}
```

## Requirements

iOS 8 or greater.

## License
Notie is released under the MIT license. See LICENSE for details.
