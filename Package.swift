// swift-tools-version:4.0
import PackageDescription


let package = Package(
    name: "Outlaw",
    dependencies: [
    ],
    targets: [
        .target(name: "Outlaw", dependencies: []),
        .testTarget(name: "OutlawTests", dependencies: ["Outlaw"])
    ]
)
