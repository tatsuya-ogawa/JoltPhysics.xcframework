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
            url: "__JOLT_URL__",
            checksum: "__JOLT_CHECKSUM__"
        )
    ]
)
