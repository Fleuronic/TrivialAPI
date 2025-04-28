// Copyright © Fleuronic LLC. All rights reserved.

import struct Trivial.Question
import protocol TrivialService.QuestionFields
import protocol Catena.Valued
import protocol Catenary.Fields

@dynamicMemberLookup
public struct QuestionDetails: QuestionFields {
	private let question: Question
}

// MARK: -
public extension QuestionDetails {
	subscript<T>(dynamicMember keyPath: KeyPath<Question, T>) -> T {
		question[keyPath: keyPath]
	}
}

// MARK: -
extension QuestionDetails: Fields {
	// MARK: Decodable
	public init(from decoder: any Decoder) throws {
		try self.init(question: .init(from: decoder))
	}
}
