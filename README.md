Notie
=====

Undistracted in-app notification in Swift, with added buttons and input box.

![Assets/NotieScreencast.gif](Assets/NotieScreencast.gif?raw=1)

## Installation

### CocoaPods

To integrate Notie into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'
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
let notie = Notie(view: self.view, message: "Are you sure you want to do that?", style: .Confirm)

notie.leftButtonAction = {
	// Add your left button action here
    notie.dismiss()
}

notie.rightButtonAction = {
	// Add your right button action here
    notie.dismiss()
}

notie.show()
```

### Show alert with input field

```swift
let notie = Notie(view: self.view, message: "Please enter your email address", style: .Input)
notie.placeholder = "email@example.com"

notie.leftButtonAction = {
	// Add your left button action here
    notie.dismiss()
}

notie.rightButtonAction = {
	// Add your right button action here
    notie.dismiss()
}

notie.show()
```

## Requirements

iOS 9 or greater.

## License
Notie is released under the MIT license. See LICENSE for details.
