## Ozan Checkout iOS

[![CocoaPods](https://img.shields.io/badge/platform-ios-orange.svg)](https://cocoapods.org/pods/OzanCheckout)
[![Languages](https://img.shields.io/badge/languages-ObjC%20%7C%20%20Swift-orange.svg?maxAge=2592000)](https://github.com/intercom/intercom-ios)
[![CocoaPods](https://img.shields.io/badge/pod-0.0.1-blue.svg)](https://cocoapods.org/pods/OzanCheckout)
[![carthage compatible](https://img.shields.io/badge/Carthage-compatible-brightgreen.svg)](https://github.com/Carthage/Carthage)
[![MIT License](https://img.shields.io/github/license/mashape/apistatus.svg)](https://www.apache.org/licenses/LICENSE-2.0.html)

## Installation

Ozan Checkout iOS supports iOS 8, iOS 9, iOS 10 and iOS 11.

### CocoaPods
Add the Intercom pod into your Podfile and run `pod install`.

    target :YourTargetName do
      pod 'OzanCheckout'
    end

### Carthage
1. Add `github "ozanlimited/ozan-checkout-ios"` to your Cartfile.
2. Run carthage update.
3. Go to your Xcode project's "General" settings. Drag `OzanCheckout.framework` from `Carthage/Build/iOS` to the "Embedded Binaries" section. Make sure “Copy items if needed” is selected and click Finish.

### Manual Installation

1. [Download Intercom for iOS](https://github.com/ozanlimited/ozan-checkout-ios/archive/master.zip) and extract the zip.
2. Go to your Xcode project's "General" settings. Drag `OzanCheckout.framework` to the "Embedded Binaries" section. Make sure "Copy items if needed" is selected and click Finish.

## Example app
There is an example app provided [here](https://github.com/ozanlimited/ozan-checkout-ios/tree/master/Examples) for both Objective-C and Swift.

