// swift-tools-version:6.0
import PackageDescription

let package = Package(
	name: "TrivialAPI",
	platforms: [
		.iOS(.v15),
		.macOS(.v12),
		.tvOS(.v15),
		.watchOS(.v8)
	],
	products: [
		.library(
			name: "TrivialAPI",
			targets: [
				"GraphQLAPI",
                "Serialization"
			]
		),
	],
	dependencies: [
        .package(url: "https://github.com/Fleuronic/TrivialService", branch: "main"),
		.package(url: "https://github.com/Fleuronic/Catenary", branch: "main"),
		.package(url: "https://github.com/jordanekay/papyrus", branch: "main")
	],
	targets: [
		.target(
			name: "GraphQLAPI",
			dependencies: ["Serialization"]
		),
        .target(
            name: "Serialization",
            dependencies: [
                "Catenary",
                "TrivialService",
                .product(name: "Papyrus", package: "papyrus")
            ]
        )
	],
	swiftLanguageModes: [.v6]
)

for target in package.targets {
	target.swiftSettings = [
		.enableExperimentalFeature("StrictConcurrency")
	]
}
