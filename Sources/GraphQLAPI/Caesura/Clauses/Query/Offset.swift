// Copyright © Fleuronic LLC. All rights reserved.

import Foundation
import protocol Catenary.Clause

struct Offset {
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
