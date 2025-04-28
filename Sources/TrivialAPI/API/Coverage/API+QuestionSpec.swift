// Copyright © Fleuronic LLC. All rights reserved.

import struct TrivialRESTAPI.QuestionDetails
import protocol TrivialService.QuestionSpec
import protocol Catenary.API
import protocol Catena.Scoped

extension API: QuestionSpec {
	#if swift(<6.0)
	public typealias QuestionFetchFields = QuestionFetchSpecifiedFields
	#endif

	public func fetchQuestions(of type: String? = nil, in category: Int? = nil, count: Int? = nil) async -> Results<QuestionFetchSpecifiedFields> {
		await result {
			try await questionEndpoints.getQuestions(
				amount: count,
				type: type,
				category: category
			).results
		}
	}
}
