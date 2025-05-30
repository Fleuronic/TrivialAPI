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
				"RESTAPI",
				"GraphQLAPI",
				"Serialization"
			]
		),
	],
	dependencies: [
		.package(url: "https://github.com/Fleuronic/TrivialService", branch: "main"),
		.package(url: "https://github.com/Fleuronic/Catenary", branch: "main"),
		.package(url: "https://github.com/jordanekay/AutoCodable", branch: "swift-syntax"),
		.package(url: "https://github.com/jordanekay/papyrus", branch: "main")
	],
	targets: [
		.target(
			name: "RESTAPI",
			dependencies: [
				"Serialization",
				"Catenary",
				.product(name: "Papyrus", package: "papyrus")
			]
		),
		.target(
			name: "GraphQLAPI",
			dependencies: [
				"Serialization",
				"Catenary",
				.product(name: "Papyrus", package: "papyrus")
			]
		),
		.target(
			name: "Serialization",
			dependencies: [
				"TrivialService",
				"AutoCodable"
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
