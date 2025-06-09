// Copyright © Fleuronic LLC. All rights reserved.

import struct Trivial.Question
import struct Trivial.Category
import struct Trivial.Answer
import protocol Catena.Scoped
import protocol TrivialService.QuestionSpec

extension API: QuestionSpec {
	#if swift(<6.0)
	public typealias QuestionListFields = QuestionSpecifiedFields
	public typealias QuestionFetchFields = QuestionSpecifiedFields
	#endif

    public func listQuestions(of type: Question.QuestionType? = nil, inCategoryWith categoryID: Category.ID? = nil, with difficulty: Question.Difficulty? = nil, count: Int? = nil) async -> Results<QuestionSpecifiedFields> {
		await result {
			try await endpoint.run(
				Query<Self, _>(
					count.map(Limit.init),
					Where<Self>(\Question.Identified.category.id, Equals(categoryID)),
					Where<Self>(\Question.Identified.value.difficulty, Equals(difficulty))
				)
			).fields
		}
	}

	public func fetchRandomQuestion(of type: Question.QuestionType? = nil, inCategoryWith categoryID: Category.ID? = nil, with difficulty: Question.Difficulty? = nil) async -> SingleResult<QuestionSpecifiedFields> {
		await result {
			try await endpoint.run(
				Query<Self, _>(
					Where<Self>(\Question.Identified.category.id, Equals(categoryID)),
					Where<Self>(\Question.Identified.value.difficulty, Equals(difficulty))
				)
			).fields.randomElement()!
		}
	}
}
