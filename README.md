# Refiner iOS SDK 

## Introduction

The Refiner iOS SDK lets you launch [survey widgets](https://refiner.io/features/survey-widgets/) directly in native iOS applications. Once the SDK is installed in your app code, surveys can be triggered through the Refiner platform without the need to change any code. 

Refiner iOS SDK's minimum deployment target is iOS 11.

## Installation with Swift Package Manager (Xcode 11+)

[Swift Package Manager](https://swift.org/package-manager/) (SwiftPM) is a tool for managing the distribution of Swift code as well as C-family dependency. From Xcode 11, SwiftPM got natively integrated with Xcode.

Refiner SDK support SwiftPM. To use SwiftPM, you should use Xcode 11 to open your project. Click `File` -> `Swift Packages` -> `Add Package Dependency`, enter [RefinerSDK repo's URL](https://github.com/organtis/refiner-ios-sdk.git). Or you can login Xcode with your GitHub account and just type `RefinerSDK` to search.

After select the package, you can choose the dependency type (tagged version, branch or commit). Then Xcode will setup all the stuff for you.

## Usage

### Initialization & Configuration

Initialize Refiner iOS SDK in your application class with the needed configuration parameters. 

```swift
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        Refiner.instance.initialize(configs: .init(projectId: "PROJECT_ID",
                                                   apiKey: "API_KEY",
                                                   userId: "USER_ID",
                                                   locale: "en_EN")) // optional
        return true
    }
```

### Identify User

Call `Identify User` to create or update a user traits in Refiner. 
```swift
    do {
        try Refiner.instance.identifyUser(
            userTraits: [
                "email": "hello@hello.com"
            ],
            userId: "USER_ID")
    } catch {
        print(error.localizedDescription)
    }
```

### Track Event

`Track Event` lets you track user events. 

```swift
Refiner.instance.trackEvent(name: "EVENT_NAME")
```

### Track Screen

`Track Screen` lets you track the current screen a user is viewing.

```swift
Refiner.instance.trackScreen(name: "SCREEN_NAME")
```

### Show Form

If you use the Manual Trigger Event for your survey, you need to call `Show Form` whenever you want to launch the survey.

```swift
Refiner.instance.showForm(uuid: "FORM_UUID")
/* OR */
Refiner.instance.showForm(uuid: "FORM_UUID", force: true)
```

### Attach Contextual Data

Attach contextual data to the survey submissions with `attachToResponse`. Set `null` to remove the contextual data.

```swift
    Refiner.instance.attachToResponse(
        data: [
            "some_data": "hello",
            "some_more_data": "hello again"
        ])
```

### Reset User

Call `Reset User` to reset the user identifier previously set through `Identify User`. We recommend calling this method when the user logs out from your app.

```swift
    Refiner.instance.resetUser()
```
