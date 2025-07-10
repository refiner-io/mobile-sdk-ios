# Refiner Mobile SDK for iOS

[![Platform](https://img.shields.io/badge/platform-iOS-green.svg)](https://refiner.io)
[![Version](https://img.shields.io/cocoapods/v/RefinerSDK.svg?style=flat)](https://cocoapods.org/pods/RefinerSDK)
[![Package Manager](https://img.shields.io/badge/package%20manager-compatible-green.svg?logo=Swift)](https://github.com/refiner-io/mobile-sdk-ios)

This repository hosts the official Refiner iOS SDK. Installing the SDK allows you to track user data in Refiner and launch in-app surveys within your iOS app.

Refiner iOS SDK's minimum deployment target is iOS 11.

Refiner is a customer feedback survey platform designed specifically for web and mobile applications. Get spot-on insights from your users with perfectly timed [mobile app microsurveys](https://refiner.io/features/mobile-app-surveys/).

With Refiner you can ask your users any question while they are using your iOS mobile app. Measure [customer satisfaction (CSAT)](https://refiner.io/solutions/csat/), [Net Promoter Score (NPS)](https://refiner.io/solutions/nps/), or [customer effort score (CES)](https://refiner.io/solutions/ces/), research what to built next or profile your users. Refiner supports all product feedback survey use cases and comes packed with expert-built templates that will get you started quickly.

Refiner integrates into your marketing & sales tech stack seamlessly. Our integrations allow you to sync survey response data in real time to third party tools, such as your CRM, email marketing automation platform, your backend API or data warehouse.  

Please find more information about how Refiner mobile app survey work in our [documentation](https://refiner.io/docs/kb/mobile-sdk/getting-started/).

## 1) Installation
    The Refiner iOS SDK can be added either by using CocoaPods or SPM.

### 1.1 Swift Package Manager (Xcode 11+)

[Swift Package Manager](https://swift.org/package-manager/) (SwiftPM) is a tool for managing the distribution of Swift code as well as C-family dependency. From Xcode 11, SwiftPM got natively integrated with Xcode.

Refiner SDK support SwiftPM. To use SwiftPM, you should use Xcode 11 to open your project. Click `File` -> `Swift Packages` -> `Add Package Dependency`, enter [RefinerSDK repo's URL](https://github.com/refiner-io/mobile-sdk-ios.git). Or you can login Xcode with your GitHub account and just type `RefinerSDK` to search.

After select the package, you can choose the dependency type (tagged version, branch or commit). Then Xcode will setup all the stuff for you.

### 1.2 CocoaPods

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

## 2) Usage

Visit our [documentation](https://refiner.io/docs/kb/mobile-sdk/mobile-sdk-reference/) for more information about how to use the SDK methods.

### Initialization & Configuration

Initialize Refiner iOS SDK in your application class with the needed configuration parameters. 

```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    Refiner.instance.initialize(projectId: "PROJECT_ID", debugMode: true)
    return true
}
```

### Identify User

Call `Identify User` to create or update a user traits in Refiner. 


The first parameter is the userId of your logged-in user and is the only mandatory parameter. 

The second parameter is an object of user traits. You can omit or set this value to `null` if you don't want to send any user traits to your Refiner account.

```swift
Refiner.instance.identifyUser(
    userTraits: [
        "email": "hello@hello.com"
        "something": "else"
    ],
    userId: "USER_ID"
)
```

#### Advanced parameters

The third parameter is for setting the `locale` of a user and is optional. The expected format is a two letter [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) language code. When provided, the locale code is used for launching surveys for specific languages, as well as launching translated surveys. You can omit or set the value to `null` if you are not using any language specific features.

The fourth parameter is an optional [Identity Verification](https://refiner.io/docs/kb/settings/identity-verification/) signature. We recommend to use a Identify Verification signature for increased security in a production environment. For development purposes, you can omit or set this value to `null`.

The fifth parameter allows you to change the data storage mode for userTraits from the default "append" mode to "replace". By default, traits are appended to the existing user record—this means previously stored data will persist even if it's not included in the current payload. When set to "replace", only the traits provided in the current payload are kept. Any previously stored traits that are not included will be removed from the user object in Refiner.

```swift
Refiner.instance.identifyUser(
    userTraits: [
        "email": "hello@hello.com"
        "something": "else"
    ],
    userId: "USER_ID",
    locale: "en", 
    signature: "SIGNATURE",
    writeOperation: Refiner.WriteOperation.replace.rawValue
)
```

### Set User

The `Set User` method acts as an alternative to the `Identify User` method described above. 

In contrast to the `Identify User` method, the `Set User` method does not immediately create a user object in your Refiner account. The provided user Id and traits are kept locally in your app and no data is communicated to our servers at first. Only when the user performs a meaningful action in your app (e.g. `Track Event` or `Track Screen` is executed) will a user object be created in Refiner. Provided user traits will be attached to the user object when a survey is shown.

The purpose of this alternative method is provide a way to identify users locally when the SDK is initialised but keep the number of tracked users in your Refiner account to a minimum.

```swift
Refiner.instance.setUser(
    userTraits: [
        "email": "hello@hello.com"
        "something": "else"
    ],
    userId: "USER_ID",
    locale: "en", 
    signature: "SIGNATURE")
```

### Track Event

`Track Event` lets you track user events. Tracked events can be used to create user segments and target audiences in Refiner.

```swift
Refiner.instance.trackEvent(name: "EVENT_NAME")
```

### Track Screen

`Track Screen` provides to track screen that user is currently on. Screen information can be used to launch surveys in specific areas of your app. 

We recommend to track screens on which you might want to show a survey one day. There is no need to systematically track all screens of your app.

```swift
Refiner.instance.trackScreen(name: "SCREEN_NAME")
```

### Ping

Depending on your setup, you might want to initiate regular checks for surveys that are scheduled for the current user. For example when you are using time based trigger events, or when a target audience is based on user data received by our backend API. 

The `Ping` method provides an easy way to perform such checks. You can call the `Ping` method at key moments in a user's journey, such as when the app is re-opened, or when the user performs a specific action.

```swift
Refiner.ping()
```

### Show Form

If you use the Manual Trigger Event for your survey, you need to call `Show Form` whenever you want to launch the survey.

```swift
Refiner.instance.showForm(uuid: "FORM_UUID")
```

For testing purposes, you can also provide an additional `force` parameter which will bypass all targeting rules and always display the survey.

```swift
Refiner.instance.showForm(uuid: "FORM_UUID", force: true)
```

### Attach Contextual Data

Attach contextual data to the survey submissions with `addToResponse`. Set `null` to remove the contextual data.

```swift
Refiner.instance.addToResponse(
    data: [
        "some_data": "hello",
        "some_more_data": "hello again"
    ])
```

### Start user session

A new user session is automatically detected when a user returns to your application after at least one hour of inactivity. You can choose to manually start a new user session with the method shown below. You can call this method for example right after a user opens your app.

```swift
Refiner.instance.startSession()
```

### Reset User

Call `Reset User` to reset the user identifier previously set through `Identify User`. We recommend calling this method when the user logs out from your app.

```swift
Refiner.instance.resetUser()
```

### Set Project

Change the environment UUID during runtime, after the SDK has been initialised.

```swift
Refiner.instance.setProject(projectId: "PROJECT_ID");
```

### Close Surveys

Close a survey programmatically without sending any information to the backend API with the `closeForm` method. 

```swift
Refiner.instance.closeForm(uuid: "FORM_UUID")
```

Close a survey programmatically and send a "dismissed at" timestamp to the backend server with the `dismissForm` method. 

```swift
Refiner.instance.dismissForm(uuid: "FORM_UUID")
```

### Register callback functions

Registering callback functions allows you to execute any code at specific moments in the lifecycle of a survey.
A popular use-case for callback functions is to redirect a user to a new screen once they completed a survey.

`onBeforeShow` gets called right before a survey is supposed to be shown.

```swift
     Refiner.instance.onBeforeShow = { formId, formConfig in
            print("onBeforeShowCallback")
            print("formId: \(formId))")
            print("formConfig: \(formConfig ?? ""))")
        }
```

`onNavigation` gets called when the user moves through the survey

```swift
    Refiner.instance.onNavigation = { formId, formElement, progress in
        print("onNavigationCallback")
        print("formId: \(formId))")
        print("formElement: \(formElement ?? ""))")
        print("progress: \(progress ?? ""))")
    }    
```

`onShow` gets called when a survey widget becomes visible to your user.

```swift
    Refiner.instance.onShow = { formId in
        print("onShowCallback")
        print("formId: \(formId))")
    }
```

`onClose` gets called when the survey widgets disappears from the screen.

```swift
    Refiner.instance.onClose = { formId in
        print("onCloseCallback")
        print("formId: \(formId))")
    }
```

`onDismiss` gets called when the user dismissed a survey by clicking on the “x” in the top right corner.

```swift
    Refiner.instance.onComplete = { formId, formData in
        print("onCompleteCallback")
        print("formId: \(formId))")
        print("formData: \(formData ?? ""))")
    }
```

`onComplete` gets called when the user completed (submitted) a survey.

```swift
    Refiner.instance.onDismiss = { formId in
        print("onDismissCallback")
        print("formId: \(formId))")
    }
```     
        
`onError` gets called when an error occured.

```swift
    Refiner.instance.onError = { message in
        print("onErrorCallback")
        print("message: \(message)")
    }
```     
