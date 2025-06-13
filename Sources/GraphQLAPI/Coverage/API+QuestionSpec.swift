// Copyright © Fleuronic LLC. All rights reserved.

import struct Trivial.Question
import struct Trivial.Category
import protocol Catena.Scoped
import protocol TrivialService.QuestionSpec

extension API: QuestionSpec {
	#if swift(<6.0)
	public typealias QuestionListFields = QuestionSpecifiedFields
	#endif

    public func listQuestions(of type: Question.QuestionType? = nil, inCategoryWith categoryID: Category.ID? = nil, with difficulty: Question.Difficulty? = nil, count: Int? = nil) async -> Results<QuestionSpecifiedFields> {
		await result {
			try await endpoint.run(
				Query<Self, _>(
					Limit(count),
					Where(\.category.id, Equals(categoryID)),
					Where(\.value.difficulty, Equals(difficulty))
				)
			).fields
		}
	}
}
