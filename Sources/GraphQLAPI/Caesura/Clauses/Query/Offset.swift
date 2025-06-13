// Copyright © Fleuronic LLC. All rights reserved.

import Schemata
import protocol Catenary.Clause
import protocol Catenary.Schematic

struct Offset<
	Model: Schemata.Model,
	Schematic: Catenary.Schematic
> {
	let body: Int

	init?(_ value: Int?) {
		guard let value else { return nil }
		
		body = value
	}
}

// MARK: -
extension Offset: Clause {
	enum CodingKeys: String, CodingKey, CaseIterable {
		case body = "offset"
	}
}
