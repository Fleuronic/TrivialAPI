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
			targets: ["TrivialAPI"]
		),
	],
	dependencies: [.package(url: "https://github.com/Fleuronic/TrivialService", branch: "main")],
	targets: [
		.target(
			name: "TrivialAPI",
			dependencies: ["TrivialService"]
		)
	],
	swiftLanguageModes: [.v6]
)

for target in package.targets {
	target.swiftSettings = [
		.enableExperimentalFeature("StrictConcurrency")
	]
}
