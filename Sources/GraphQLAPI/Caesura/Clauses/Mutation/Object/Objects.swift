// Copyright © Fleuronic LLC. All rights reserved.

import Foundation
import struct Catenary.ArgumentList
import protocol Catenary.Input
import protocol Catenary.Clause

struct Objects {
	let body: [ArgumentList]

	init(_ values: [some Input]) {
		body = values.map(\.argumentList)
	}
}

// MARK: -
extension Objects: Clause {
	enum CodingKeys: String, CodingKey, CaseIterable {
		case body = "objects"
	}
}
