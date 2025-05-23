// Copyright © Fleuronic LLC. All rights reserved.

import class Papyrus.Provider
import protocol Catenary.API
import protocol Catenary.Fields
import protocol TrivialService.QuestionFields

public struct API<
	QuestionEndpoints: RESTAPI.QuestionEndpoints,
	QuestionFetchSpecifiedFields: QuestionFields & Fields
>: @unchecked Sendable {
	public let questionEndpoints: QuestionEndpoints
}

// MARK: -
public extension API {
	func specifyingQuestionFields<Fields>(_: Fields.Type) -> API<QuestionEndpoints, Fields> {
		.init(questionEndpoints: questionEndpoints)
	}
}

public extension API<QuestionEndpointsAPI, QuestionDetails> {
	init() {
		let url = "https://opentdb.com/api.php"
		let provider = Provider(baseURL: url).intercept { request, process in
			let response = try await process(request)
			try response.apiError.map { throw $0 }
			return response
		}

		self.init(questionEndpoints: .init(provider: provider))
	}
}

public extension API<QuestionEndpointsMock, QuestionDetails> {
	static var mock: Self {
		.init(questionEndpoints: .init())
	}
}

// MARK: -
extension API: Catenary.API {
	public typealias APIError = RESTAPI.APIError
}
