// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FPHIDisclaimerWidget-SPM",
    defaultLocalization: "es",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "FPHIDisclaimerWidget-SPM",
            targets: ["FPHIDisclaimerWidget-SPM", "FPHIDisclaimerWidget"],
        ),
        .library(
            name: "FPHIDisclaimerWidgetResources",
            targets: ["FPHIDisclaimerWidgetResources-SPM"],
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/facephi-clienters/SDK-FPHIDesignSystemResources-SPM.git", exact: "2.8.3"),
    ],
    targets: [
        .target(
            name: "FPHIDisclaimerWidget-SPM",
            dependencies: [
                "FPHIDisclaimerWidget",
                "FPHIDisclaimerWidgetResources-SPM",
                .product(name: "FPHIDesignSystemResources", package: "SDK-FPHIDesignSystemResources-SPM"),
            ]
        ),
        .target(
            name: "FPHIDisclaimerWidgetResources-SPM",
            resources: [.copy("compose/cocoapods/compose-resources")]
        ),
        .binaryTarget(
            name: "FPHIDisclaimerWidget",
            url: "https://facephicorp.jfrog.io/artifactory/spm-pro-fphi/WIDGET/FPHIDisclaimerWidget/0.2.1/FPHIDisclaimerWidget.zip",
            checksum: "2d26758a2d5f27ccd099487bc74e87ea4e84bb593edc562401f67aee5cf1be06"
        ),
    ]
)
