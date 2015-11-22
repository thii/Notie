Notie
=====

Undistracted in-app notification in Swift, with added buttons and input box.

This library is still work in progress. Do not use it in production, yet.

![Assets/ConfirmNotie.png](Assets/ConfirmNotie.png?raw=1)
![Assets/InputNotie.png](Assets/InputNotie.png?raw=1)

## Installation

### CocoaPods

To integrate Notie into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

pod 'Notie'
```

Then, run the following command:

```bash
$ pod install
```

And add `import Notie` to the top of the files using Notie.

## Examples

### Show alert with confirm buttons

```swift
    let notie = Notie(view: self.view, title: "", message: "Are you sure you want to do that?", style: .Confirm)

    notie.leftButtonAction = {
        notie.dismiss()
    }

    notie.rightButtonAction = {
        notie.dismiss()
    }

    notie.show()
```

### Show alert with input field

```swift
    let notie = Notie(view: self.view, title: "", message: "Please enter your email address", style: .Input)

    notie.leftButtonAction = {
        notie.dismiss()
    }

    notie.rightButtonAction = {
        notie.dismiss()
    }

    notie.show()
```

## Requirements

iOS 8 or greater.

## License
Notie is released under the MIT license. See LICENSE for details.
