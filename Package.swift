// swift-tools-version:4.0
import PackageDescription


let package = Package(
    name: "Outlaw",
    products: [
        .library(name: "Outlaw", targets: ["Outlaw"])
    ],
    dependencies: [
    ],
    targets: [
        .target(name: "Outlaw", dependencies: []),
        .testTarget(name: "OutlawTests", dependencies: ["Outlaw"])
    ]
)
