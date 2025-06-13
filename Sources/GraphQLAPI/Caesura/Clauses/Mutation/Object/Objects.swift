// Copyright © Fleuronic LLC. All rights reserved.

import Schemata
import struct Catenary.ArgumentList
import protocol Catenary.Input
import protocol Catenary.Clause
import protocol Catenary.Schematic

struct Objects<
	Model: Schemata.Model,
	Schematic: Catenary.Schematic
> {
	let body: [ArgumentList]

	init?(_ values: [some Input<Schematic>]?) {
		guard let values else { return nil }
		
		body = values.map(\.argumentList)
	}
}

// MARK: -
extension Objects: Clause {
	enum CodingKeys: String, CodingKey, CaseIterable {
		case body = "objects"
	}
}
