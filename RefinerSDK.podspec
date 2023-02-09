Pod::Spec.new do |s|
    s.name          = "RefinerSDK"
    s.version       = "1.1.7"
    s.summary       = "Refiner iOS SDK"
    s.homepage      = "https://refiner.io"
    s.author        = { "Refiner" => "contact@refiner.io" }

    s.source        = { :git => "https://github.com/refiner-io/mobile-sdk-ios.git", :tag => s.version.to_s }

    s.platform     = :ios, 11.0
    s.requires_arc = true

    s.vendored_frameworks = "RefinerSDK.xcframework", "RefinerInternalSDK.xcframework"
    
    s.license      = {
        :type => 'Copyright',
        :text => <<-LICENSE
        Copyright 2022 Refiner, Inc. All rights reserved.
        LICENSE
    }
    
    s.swift_version = "5.5.2"
    s.ios.deployment_target  = '11.0'
    
    
end
