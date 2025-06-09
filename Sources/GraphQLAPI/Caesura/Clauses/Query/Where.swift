// Copyright © Fleuronic LLC. All rights reserved.

import Schemata
import SociableWeaver
import struct Catenary.ArgumentList
import struct Catenary.Schema
import protocol Catenary.Clause
import protocol Catenary.Schematic

struct Where<Schematic: Catenary.Schematic> {
	let body: ArgumentList

	init?<Model: Schemata.Model, Body>(
		_ keyPath: KeyPath<Model, Body>,
		_ condition: (some Clause<Body>)?
	) {
		guard let condition else { return nil }

		var components = Schematic.schema[keyPath]
		var arguments: [String: any ArgumentValueRepresentable & Sendable] = [components.last!: ArgumentList(condition)]
		while components.count > 1 {
			let component = components.removeLast()
			arguments[components.last!] = arguments
			arguments.removeValue(forKey: component)
		}

		body = .init(arguments)
	}
}

// MARK: -
extension Where: Clause {
	enum CodingKeys: String, CodingKey, CaseIterable {
		case body = "where"
	}
}
