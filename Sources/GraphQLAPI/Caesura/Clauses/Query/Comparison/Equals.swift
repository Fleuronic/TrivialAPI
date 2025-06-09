// Copyright © Fleuronic LLC. All rights reserved.

import Schemata
import SociableWeaver
import protocol Catenary.Clause
import struct Catenary.Schema

struct Equals<Value: Encodable & ArgumentValueRepresentable> {
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
