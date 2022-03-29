// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MyTestPackage",
    platforms: [
       .iOS(.v14)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "MyTestPackage",
            targets: ["MyTestPackage"]
        
        ),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
         .package(url: "https://github.com/AmwayACS/Amway-Base-Utility.git", branch: "main"),
         .package(url: "https://github.com/edudnyk/SheeKit", branch: "main"),
         .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.5.0"))
            
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "MyTestPackage",
            dependencies: ["Amway-Base-Utility", "Alamofire","SheeKit"],
            exclude: ["Info.plist"],
            resources: [
                .process("CourseData.json"),
                .process("ExploreFilter.json"),
                .process("MyCourseEmptyState.json"),
                .process("SyllabusData.json"),
                .process("video.mp4"),
                .process("Fonts")
                
            ]
        
        ),
        .testTarget(
            name: "MyTestPackageTests",
            dependencies: ["MyTestPackage"]
        
        ),
    ]
)