Notie
=====

[![Build Status](https://travis-ci.org/thii/Notie.svg)](https://travis-ci.org/thii/Notie)
[![Cocoapods Compatible](https://img.shields.io/cocoapods/v/Notie.svg)](https://img.shields.io/cocoapods/v/Notie.svg)
[![Docs](https://img.shields.io/cocoapods/metrics/doc-percent/Notie.svg)](http://cocoadocs.org/docsets/Notie)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Platform](https://img.shields.io/cocoapods/p/Notie.svg?style=flat)](http://cocoadocs.org/docsets/Notie)
[![License](https://img.shields.io/cocoapods/l/Notie.svg)](https://raw.githubusercontent.com/thii/Notie/master/LICENSE)

Undistracted in-app notification in Swift, with added buttons and input box.

![](https://raw.githubusercontent.com/thii/Notie/master/Assets/NotieScreencast.gif)

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

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate Notie into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "thii/Notie"
```

Run `carthage` to build the framework and drag the built `Notie.framework` into your Xcode project.

## Usage

### Example

Show a notification with `Confirm` style

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

### Parameters

The following parameters can be modified to customize the appearance of the notification.

- `style`: The style of the notification. `.Confirm` style includes message view and two confirm buttons. `.Input` style adds an extra input text field. Default to `.Confirm`.

- `leftButtonAction`: A block to call when the user taps on the left button.

- `rightButtonAction`: A block to call when the user taps on the right button.

- `leftButtonTitle`: The title of the left button. Default to `OK`.

- `rightButtonTitle`: The title of the left button. Default to `Cancel`.

- `placeholder`: The placeholder of the input text field. Default to `nil`.

- `animationDuration`: How long the slide down animation should last.

- `messageBackgroundColor`: The background color of the message view.

- `messageTextColor`: The text color of the message view. Default to white color.

- `inputFieldBackgroundColor`: The background color of the input text field. Default to white color.

- `inputFieldTextColor`: The text color of the input text field. Default to dark gray.

- `leftButtonBackgroundColor`: The background color of the left button.

- `leftButtonTextColor`: The text color of the left button. Default to white color.

- `rightButtonBackgroundColor`: The background color of the right button.

- `rightButtonTextColor`: The text color of the right button. Default to white color.


## Requirements

iOS 9 or greater.

## License
Notie is released under the MIT license. See LICENSE for details.
