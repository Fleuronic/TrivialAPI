// Copyright © Fleuronic LLC. All rights reserved.

import Schemata
import struct Catenary.ArgumentList
import protocol Catenary.Input
import protocol Catenary.Clause
import protocol Catenary.Schematic

struct Object<
	Model: Schemata.Model,
	Schematic: Catenary.Schematic
> {
	let body: ArgumentList

	init?(_ value: (some Input<Schematic>)?) {
		guard let value else { return nil }
		
		body = value.argumentList
	}
}

// MARK: -
extension Object: Clause {
	enum CodingKeys: String, CodingKey, CaseIterable {
		case body = "object"
	}
}
