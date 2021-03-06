[![Platform](https://img.shields.io/badge/platform-iOS-green.svg)](https://refiner.io)
[![Version](https://img.shields.io/cocoapods/v/RefinerSDK.svg?style=flat)](https://cocoapods.org/pods/RefinerSDK)
[![Package Manager](https://img.shields.io/badge/package%20manager-compatible-green.svg?logo=Swift)](https://github.com/refiner-io/mobile-sdk-ios)


# Refiner Mobile SDK integration

## iOS

Refiner iOS SDK's minimum deployment target is iOS 11.

### 1) Installation
    The Refiner iOS SDK can be added either by using CocoaPods or SPM.

#### 1.1 Swift Package Manager (Xcode 11+)

[Swift Package Manager](https://swift.org/package-manager/) (SwiftPM) is a tool for managing the distribution of Swift code as well as C-family dependency. From Xcode 11, SwiftPM got natively integrated with Xcode.

Refiner SDK support SwiftPM. To use SwiftPM, you should use Xcode 11 to open your project. Click `File` -> `Swift Packages` -> `Add Package Dependency`, enter [RefinerSDK repo's URL](https://github.com/refiner-io/mobile-sdk-ios.git). Or you can login Xcode with your GitHub account and just type `RefinerSDK` to search.

After select the package, you can choose the dependency type (tagged version, branch or commit). Then Xcode will setup all the stuff for you.

#### 1.2 CocoaPods

Referencing the `RefinerSDK` pod in the `Podfile` will be sufficient to add the Refiner iOS SDK to your project.

**Steps to add:**

1. If your project doesn't have a `Podfile` then you can create one by running the following command on the terminal:

```bash
pod init
```

2. Reference `RefinerSDK` in the `Podfile`:

```podspec
target 'YOUR_APPLICATION_NAME' do

  # ... beginning of your Podfile ...

  pod 'RefinerSDK'

  # ... remaining of your Podfile ...

end
```

> **Note:** Replace `YOUR_APPLICATION_NAME` with the name of your application in the `target` section

3. Install pods by running the following command on the terminal:

```bash
pod install
```

### 2) Usage

Visit our [documentation](https://refiner.io/docs/kb/mobile-sdk/mobile-sdk-reference/) for more information about how to use the SDK methods.

#### Initialization & Configuration

Initialize Refiner iOS SDK in your application class with the needed configuration parameters. 

```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    Refiner.instance.initialize(projectId: "PROJECT_ID")
    return true
}
```

#### Identify User

Call `Identify User` to create or update a user traits in Refiner. 
```swift
do {
    try Refiner.instance.identifyUser(
        userTraits: [
            "email": "hello@hello.com"
            "something": "else"
        ],
        userId: "USER_ID",
        locale: "en_EN")
} catch {
    print(error.localizedDescription)
}
```

#### Track Event

`Track Event` lets you track user events. Tracked events can be used to create user segments and target audiences in Refiner.

```swift
Refiner.instance.trackEvent(name: "EVENT_NAME")
```

#### Track Screen

`Track Screen` provides to track screen that user is currently on. Screen information can be used to launch surveys in specific areas of your app.

```swift
Refiner.instance.trackScreen(name: "SCREEN_NAME")
```

#### Show Form

If you use the Manual Trigger Event for your survey, you need to call `Show Form` whenever you want to launch the survey.

```swift
Refiner.instance.showForm(uuid: "FORM_UUID")
```

For testing purposes, you can also provide an additional `force` parameter which will bypass all targeting rules and always display the survey.

```swift
Refiner.instance.showForm(uuid: "FORM_UUID", force: true)
```

#### Attach Contextual Data

Attach contextual data to the survey submissions with `attachToResponse`. Set `null` to remove the contextual data.

```swift
Refiner.instance.attachToResponse(
    data: [
        "some_data": "hello",
        "some_more_data": "hello again"
    ])
```

#### Reset User

Call `Reset User` to reset the user identifier previously set through `Identify User`. We recommend calling this method when the user logs out from your app.

```swift
Refiner.instance.resetUser()
```
