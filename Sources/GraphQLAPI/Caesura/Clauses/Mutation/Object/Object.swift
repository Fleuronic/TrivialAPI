// Copyright © Fleuronic LLC. All rights reserved.

import Foundation
import struct Catenary.ArgumentList
import protocol Catenary.Input
import protocol Catenary.Clause
import protocol Catenary.Schematic

struct Object<Schematic: Catenary.Schematic> {
	let body: ArgumentList

	init(_ value: some Input<Schematic>) {
		body = value.argumentList
	}
}

// MARK: -
extension Object: Clause {
	enum CodingKeys: String, CodingKey, CaseIterable {
		case body = "object"
	}
}
