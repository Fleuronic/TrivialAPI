//
//  Question+Decodable.swift
//  NativeTTS
//
//  Created by Kay, Jordan (He/Him/His) on 3/18/25.
//

import struct Trivial.Question

extension Question: Swift.Decodable {
	// MARK: Decodable
	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		try self.init(
			prompt: container.decode(for: .prompt),
			questionType: container.decode(for: .questionType),
			difficulty: container.decode(for: .difficulty)
		)
	}
}
