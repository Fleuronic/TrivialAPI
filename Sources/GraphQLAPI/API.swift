// Copyright © Fleuronic LLC. All rights reserved.

import Papyrus
import Schemata
import enum Catenary.Request
import struct Trivial.Question
import struct Trivial.Answer
import struct Trivial.Category
import struct Catenary.Schema
import protocol Catena.Fields
import protocol Catenary.API
import protocol Catenary.Fields
import protocol Catenary.Schematic
import protocol TrivialService.QuestionFields
import protocol TrivialService.CategoryFields

public struct API<
	Endpoint: GraphQLAPI.Endpoint,
	QuestionSpecifiedFields: QuestionFields & Catenary.Fields<Question.Identified> & ModelProjection,
	CategorySpecifiedFields: CategoryFields & Catenary.Fields<Category.Identified> & ModelProjection
>: @unchecked Sendable {
	public let endpoint: Endpoint
}

// MARK: -
public extension API {
    func specifyingQuestionFields<Fields>(_: Fields.Type) -> API<
        Endpoint,
        Fields,
        CategorySpecifiedFields
    > {
        .init(endpoint: endpoint)
    }

    func specifyingCategoryFields<Fields>(_: Fields.Type) -> API<
        Endpoint,
        QuestionSpecifiedFields,
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
extension API: Catenary.API {
    // MARK: API
	public typealias APIError = Request.Error
}

extension API: Schematic {
    // MARK: Schematic
	public static var schema: Schema {
//		.init(
//			Question.Identified.self,
//			Category.Identified.self,
//			[Answer.Identified].self
//		)
        fatalError()
	}
}

