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
        .package(url: "https://github.com/facephi-clienters/SDK-FPHIDesignSystemResources-SPM.git", exact: "2.7.7"),
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
            url: "https://facephicorp.jfrog.io/artifactory/spm-pro-fphi/WIDGET/FPHIDisclaimerWidget/0.1.11/FPHIDisclaimerWidget.zip",
            checksum: "ba4bae0f4d57b027f9a960e99bf425e6ec80b486c81a2c5e467a3498e5e8080f"
        ),
    ]
)
