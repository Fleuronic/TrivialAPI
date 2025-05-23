// Copyright © Fleuronic LLC. All rights reserved.

import struct Trivial.Question
import protocol Catena.Scoped
import protocol TrivialService.QuestionSpec

extension GraphQLAPI: QuestionSpec {
	#if swift(<6.0)
	public typealias QuestionFetchFields = QuestionSpecifiedFields
	#endif

    public func fetchQuestions(of type: Question.QuestionType? = nil, in category: Int? = nil, with difficulty: Question.Difficulty? = nil, count: Int? = nil) async -> Results<QuestionSpecifiedFields> {
		await result {
			let query = Query<QuestionSpecifiedFields>()
			return try await endpoint.run(query).fields
		}
	}
}
