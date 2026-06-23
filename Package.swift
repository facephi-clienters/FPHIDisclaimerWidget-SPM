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
    ],
    dependencies: [
        .package(url: "git@github.com:facephi-clienters/SDK-FPHIDesignSystemResources-SPM.git", exact: "1.0.0"),
    ],
    targets: [
        .plugin(
            name: "CopyResources",
            capability: .command(
                intent: .custom(verb: "copy-local-kmp-resources",
                                description: "Copy local KMP Resources for SPM"),
                permissions: [
                    .writeToPackageDirectory(reason: "Adds generated resources.")
                ]
            )
        ),
        .target(
            name: "FPHIDisclaimerWidget-SPM",
            dependencies: [
                "FPHIDisclaimerWidget",
                .product(name: "FPHIDesignSystemResources", package: "SDK-FPHIDesignSystemResources-SPM"),
            ],
            resources: [.copy("compose/cocoapods/compose-resources")]
        ),
        .binaryTarget(
            name: "FPHIDisclaimerWidget",
            url: "https://facephicorp.jfrog.io/artifactory/spm-pro-fphi/WIDGET/FPHIDisclaimerWidget/0.1.5/FPHIDisclaimerWidget.zip",
            checksum: "7ef724c43218d9b3deae615e60fc705d159d3042f2c33fa51772857156d86c4d"
        ),
    ]
)
