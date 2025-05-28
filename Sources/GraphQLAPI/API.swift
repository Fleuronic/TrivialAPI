//
//  Question.swift
//  NativeTTS
//
//  Created by Kay, Jordan (He/Him/His) on 3/13/25.
//

import Papyrus
import Schemata
import enum Catenary.Request
import struct Trivial.Question
import struct Trivial.Answer
import struct Trivial.Category
import struct Catenary.Schema
import protocol Catenary.API
import protocol Catenary.Fields
import protocol TrivialService.QuestionFields

public struct API<
	Endpoint: GraphQLAPI.Endpoint,
	QuestionSpecifiedFields: QuestionFields & Fields & ModelProjection
>: @unchecked Sendable {
	public let endpoint: Endpoint

    let schema: Schema
}

// MARK: -
public extension API {
    func specifyingQuestionFields<Fields>(_: Fields.Type) -> API<Endpoint, Fields> {
        .init(
            endpoint: endpoint,
            schema: schema
        )
    }
}

public extension API where Endpoint == EndpointAPI {
	init(apiKey: String) {
		let url = "https://oratory.hasura.app/v1/graphql"
		let provider = Provider(baseURL: url).modifyRequests { request in
			request.addHeader("x-hasura-admin-secret", value: apiKey)
		}

		self.init(
            endpoint: .init(provider: provider),
            schema: .init(
                Question.Identified.self,
                Category.Identified.self,
                [Answer.Identified].self
            )
        )
	}
}

//public extension API<QuestionEndpointsMock, QuestionDetails> {
//    static var mock: Self {
//        .init(questionEndpoints: .init())
//    }
//}

// MARK: -
extension API: Catenary.API {
	public typealias APIError = Request.Error
}

// MARK: -
private extension Schema {
    init<each T: Model>(_ types: repeat (each T).Type)  {
        var components: Set<Schema.Component> = []
        for type in repeat each types {
            components.formUnion(
                type.schema.properties
                    .map { ($0, [$1.path]) }
                    .map(Schema.Component.init)
            )
        }

        self.init(components: components)
    }
}
