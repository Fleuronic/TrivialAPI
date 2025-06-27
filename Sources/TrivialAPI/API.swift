// Copyright © Fleuronic LLC. All rights reserved.

import Papyrus
import Schemata
import enum Catenary.Request
import struct Trivial.Question
import struct Trivial.Answer
import struct Trivial.Category
import struct Catenary.Schema
import struct Caesura.EndpointAPI
import protocol Catenary.Fields
import protocol Catenary.Schematic
import protocol Caesura.API
import protocol Caesura.Endpoint
import protocol TrivialService.QuestionFields
import protocol TrivialService.CategoryFields
import protocol TrivialService.AnswerFields

public struct API<
	Endpoint: Caesura.Endpoint,
	QuestionSpecifiedFields: QuestionFields & Fields,
	CategorySpecifiedFields: CategoryFields & Fields,
	AnswerSpecifiedFields: AnswerFields & Fields
>: @unchecked Sendable {
	public let endpoint: Endpoint
}

// MARK: -
public extension API {
	func specifyingQuestionFields<Fields>(_: Fields.Type) -> API<
		Endpoint,
		Fields,
		CategorySpecifiedFields,
		AnswerSpecifiedFields
	> {
		.init(endpoint: endpoint)
	}

	func specifyingCategoryFields<Fields>(_: Fields.Type) -> API<
		Endpoint,
		QuestionSpecifiedFields,
		Fields,
		AnswerSpecifiedFields
	> {
		.init(endpoint: endpoint)
	}

	func specifyingAnswerFields<Fields>(_: Fields.Type) -> API<
		Endpoint,
		QuestionSpecifiedFields,
		CategorySpecifiedFields,
		Fields
	> {
		.init(endpoint: endpoint)
	}
}

public extension API where Endpoint == EndpointAPI {
	init(apiKey: String) {
		let url = "https://oratory.hasura.app/v1/graphql"
		let provider = Provider(baseURL: url).modifyRequests { request in
			request.addHeader("x-hasura-admin-secret", value: apiKey)
		}

		self.init(endpoint: .init(provider: provider))
	}
}

//public extension API<QuestionEndpointsMock, QuestionDetails> {
//    static var mock: Self {
//        .init(questionEndpoints: .init())
//    }
//}

// MARK: -
extension API: Caesura.API {
	// MARK: API
	public typealias APIError = Request.Error

	// MARK: Storage
	public typealias StorageError = Self.Error
}

extension API: Schematic {
	// MARK: Schematic
	public static var schema: Schema {
		.init(
			Question.Identified.self,
			Category.Identified.self,
			[Answer.Identified].self
		)
	}

	public static var enumValues: [String] {
		Question.QuestionType.allCases.map(\.encoded) +
		Question.Difficulty.allCases.map(\.encoded)
	}
}
