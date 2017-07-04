// swift-tools-version:3.1

import PackageDescription

let package = Package(
    name: "KituraHTTPTest",
    
    dependencies: [
        .Package(url: "https://github.com/IBM-Swift/Kitura-net", majorVersion: 1, minor: 7),
        .Package(url: "https://github.com/IBM-Swift/SwiftyJSON.git", majorVersion: 16),
    ]
)
