// swift-tools-version:6.3
import PackageDescription

let package = Package(
    name: "portfolio-site",
    platforms: [.macOS(.v15)],
    dependencies: [
        .package(url: "https://github.com/elementary-swift/elementary-ui.git", from: "0.4.1")
    ],
    targets: [
        .executableTarget(
            name: "PortfolioApp",
            dependencies: [
                .product(name: "ElementaryUI", package: "elementary-ui")
            ],
            exclude: ["Styles"],
            swiftSettings: [
                .swiftLanguageMode(.v5)
            ]
        )
    ]
)
