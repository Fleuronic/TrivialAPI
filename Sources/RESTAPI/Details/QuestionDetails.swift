// Copyright © Fleuronic LLC. All rights reserved.

import struct Trivial.Question
import struct Trivial.Answer
import struct Trivial.Category
import protocol TrivialService.QuestionFields
import protocol Catena.Valued
import protocol Catenary.Fields
import protocol Catenary.Details

@dynamicMemberLookup
public struct QuestionDetails: QuestionFields {
	public let category: Category
	public let correctAnswer: Answer
	public let incorrectAnswers: [Answer]

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
	public static func decoded(from decoder: any Decoder) throws -> Self {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		return try self.init(
			category: .init(name: container.decode(for: .category)),
			correctAnswer: .init(
				text: container.decode(for: .correctAnswer),
				isCorrect: true
			),
			incorrectAnswers: container.decode([String].self, forKey: .incorrectAnswers).map { text in
				.init(
					text: text,
					isCorrect: false
				)
			},
			question: .init(from: decoder)
		)
	}
}

// MARK: -
private extension QuestionDetails {
	enum CodingKeys: String, CodingKey {
		case category
		case correctAnswer
		case incorrectAnswers
	}
}
