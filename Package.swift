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
        .package(url: "https://github.com/facephi-clienters/SDK-FPHIDesignSystemResources-SPM.git", exact: "2.8.5"),
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
            url: "https://facephicorp.jfrog.io/artifactory/spm-pro-fphi/WIDGET/FPHIDisclaimerWidget/0.2.3/FPHIDisclaimerWidget.zip",
            checksum: "44ca4fe64846180e78ba19bfa64d032a18eb8b3fa41728c61c2b6929e8d83bfe"
        ),
    ]
)
