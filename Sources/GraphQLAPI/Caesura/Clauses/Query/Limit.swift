// Copyright © Fleuronic LLC. All rights reserved.

import Foundation
import protocol Catenary.Clause

struct Limit {
	let body: Int

	init(_ count: Int) {
		body = count
	}
}

// MARK: -
extension Limit: Clause {
	enum CodingKeys: String, CodingKey, CaseIterable {
		case body = "limit"
	}
}
