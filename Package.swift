// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "KituraHTTPTest",
    
    dependencies: [
        .package(url: "https://github.com/IBM-Swift/Kitura-net.git", from: "1.7.0"),
        .package(url: "https://github.com/IBM-Swift/SwiftyJSON.git", from: "16.0.0")
    ],
    
    targets: [
        .target(name: "KituraHTTPTest", dependencies: ["KituraNet", "SwiftyJSON"]),
        .testTarget(name: "KituraHTTPTestTests", dependencies: ["KituraHTTPTest"])
    ]
)
