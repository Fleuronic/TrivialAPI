// Copyright © Fleuronic LLC. All rights reserved.

import Schemata
import SociableWeaver
import struct Catenary.Schema
import protocol Catenary.Clause
import protocol Catenary.Schematic

struct Equals<
	Model: Schemata.Model,
	Schematic: Catenary.Schematic,
	Value: Encodable & ArgumentValueRepresentable
> {
	let body: Value

	init?(_ value: Value?) {
		guard let value else { return nil }
		
		body = value
	}
}

// MARK: -
extension Equals: Clause {
	enum CodingKeys: String, CodingKey, CaseIterable {
		case body = "_eq"
	}
}
