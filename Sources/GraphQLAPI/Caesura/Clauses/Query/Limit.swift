// Copyright © Fleuronic LLC. All rights reserved.

import Schemata
import protocol Catenary.Clause
import protocol Catenary.Schematic

struct Limit<
	Model: Schemata.Model,
	Schematic: Catenary.Schematic
> {
	let body: Int

	init?(_ count: Int?) {
		guard let count else { return nil }
		
		body = count
	}
}

// MARK: -
extension Limit: Clause {
	enum CodingKeys: String, CodingKey, CaseIterable {
		case body = "limit"
	}
}
