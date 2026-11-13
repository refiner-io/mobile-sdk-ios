Pod::Spec.new do |s|
    s.name          = "RefinerSDK"
    s.version       = "2.1.0"
    s.summary       = "Refiner iOS SDK"
    s.homepage      = "https://refiner.io"
    s.author        = { "Refiner" => "contact@refiner.io" }

    s.source        = { :git => "https://github.com/refiner-io/mobile-sdk-ios.git", :tag => s.version.to_s }

    s.platform     = :ios, "13.0"
    s.requires_arc = true

    s.vendored_frameworks = "RefinerSDK.xcframework"

    # LICENSE is copied into the distribution repo by the release workflow.
    s.license      = { :type => "Apache-2.0", :file => "LICENSE" }

    s.swift_version = "5.9"
    s.ios.deployment_target  = '13.0'

end
