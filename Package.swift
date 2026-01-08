// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "JoltPhysics",
    platforms: [
        .iOS(.v18)
    ],
    products: [
        .library(
            name: "JoltPhysics",
            targets: ["JoltPhysics"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "JoltPhysics",
            url: "https://github.com/tatsuya-ogawa/JoltPhysics.xcframework/releases/download/5.5.0/JoltPhysics.xcframework.zip",
            checksum: "c93b4d7df1578354c0ee6d5cb381712485b2c7c59b8a1968dedf91e34a7b1f25"
        )
    ]
)
