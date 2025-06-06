//
//  File.swift
//  TrivialAPI
//
//  Created by Kay, Jordan (He/Him/His) on 5/2/25.
//

import TrivialService
import struct Trivial.Question

extension Question.Difficulty: Swift.Decodable {
	// MARK: Decodable
	public init(from decoder: any Decoder) throws {
		let container = try decoder.singleValueContainer()
		self = try .decoded(container.decode())
	}
}

// MARK: -
extension Question.Difficulty: Swift.Encodable {
	// MARK: Encodable
	public func encode(to encoder: any Encoder) throws {
		var container = encoder.singleValueContainer()
		try container.encode(encoded)
	}
}
