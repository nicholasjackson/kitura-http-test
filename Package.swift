// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "KituraHTTPTest",

    products: [
        .library(
            name: "KituraHTTPTest",
            targets: ["KituraHTTPTest"]
        )
    ],
    
    dependencies: [
        .package(url: "https://github.com/IBM-Swift/Kitura-net.git", .upToNextMinor(from: "1.7.0")),
        .package(url: "https://github.com/IBM-Swift/SwiftyJSON.git", .upToNextMinor(from: "17.0.0"))
    ],
    
    targets: [
        .target(name: "KituraHTTPTest", dependencies: ["KituraNet", "SwiftyJSON"]),
        .testTarget(name: "KituraHTTPTestTests", dependencies: ["KituraHTTPTest"])
    ]
)
