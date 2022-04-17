# Refiner Mobile SDK integration

## iOS

Refiner iOS SDK's minimum deployment target is iOS 11.

### 1) Installation - Swift Package Manager (Xcode 11+)

[Swift Package Manager](https://swift.org/package-manager/) (SwiftPM) is a tool for managing the distribution of Swift code as well as C-family dependency. From Xcode 11, SwiftPM got natively integrated with Xcode.

Refiner SDK support SwiftPM. To use SwiftPM, you should use Xcode 11 to open your project. Click `File` -> `Swift Packages` -> `Add Package Dependency`, enter [RefinerSDK repo's URL](https://github.com/organtis/refiner-ios-sdk.git). Or you can login Xcode with your GitHub account and just type `RefinerSDK` to search.

After select the package, you can choose the dependency type (tagged version, branch or commit). Then Xcode will setup all the stuff for you.

### 2) Usage

#### Initialization & Configuration

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

#### Identify User

Call `Identify User` to create or update a user in Refiner.

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

#### Track Event

`Track Event` provides to track user events.

```swift
Refiner.instance.trackEvent(name: "EVENT_NAME")
```

#### Track Screen

`Track Screen` provides to track screen that user viewed.

```swift
Refiner.instance.trackScreen(name: "SCREEN_NAME")
```

#### Show Form

// TODO

```swift
Refiner.instance.showForm(uuid: "FORM_UUID")
/* OR */
Refiner.instance.showForm(uuid: "FORM_UUID", force: true)
```

#### Attach Contextual Data

In order to attach contextual data to the survey submissions, call `attachToResponse`.

```swift
    Refiner.instance.attachToResponse(
        data: [
            "some_data": "hello",
            "some_more_data": "hello again"
        ])
```

#### Reset User

//TODO

```swift
    Refiner.instance.resetUser()
```
