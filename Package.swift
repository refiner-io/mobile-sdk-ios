// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "RefinerSDK",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "RefinerSDK",
            targets: [
                "RefinerSDK",
                "RefinerInternalSDK"
            ]
        ),
    ],
    targets: [
        .binaryTarget(
            name: "RefinerSDK",
            path: "./RefinerSDK.xcframework",
            resources: [
                .copy("PrivacyInfo.xcprivacy")
            ]
        ),
        .binaryTarget(
            name: "RefinerInternalSDK",
            path: "./RefinerInternalSDK.xcframework"
        )
    ]
)
