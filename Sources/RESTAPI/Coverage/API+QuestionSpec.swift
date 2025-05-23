// Copyright © Fleuronic LLC. All rights reserved.

import struct Trivial.Question

import protocol TrivialService.QuestionSpec
import protocol Catena.Scoped

extension API: QuestionSpec {
	#if swift(<6.0)
	public typealias QuestionFetchFields = QuestionFetchSpecifiedFields
	#endif

    public func fetchQuestions(of type: Question.QuestionType? = nil, in category: Int? = nil, with difficulty: Question.Difficulty? = nil, count: Int? = nil) async -> Results<QuestionFetchSpecifiedFields> {
		await result {
			try await questionEndpoints.getQuestions(
				type: type,
				category: category,
                difficulty: difficulty,
				amount: count ?? .defaultCount
			).results
		}
	}
}

// MARK: -
private extension Int {
	static let defaultCount = 50
}
