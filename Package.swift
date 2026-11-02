// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "RefinerSDK",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "RefinerSDK",
            targets: ["RefinerSDK"]
        ),
    ],
    targets: [
        .binaryTarget(
            name: "RefinerSDK",
            path: "./RefinerSDK.xcframework"
        ),
    ]
)
