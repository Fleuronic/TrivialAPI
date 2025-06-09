// Copyright © Fleuronic LLC. All rights reserved.

import struct Trivial.Question

extension Question: Swift.Decodable {
	// MARK: Decodable
	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: Identified.Path.self)
		try self.init(
			prompt: container.decode(for: .question),
			questionType: container.decode(for: .questionType),
			difficulty: container.decode(for: .difficulty)
		)
	}
}
