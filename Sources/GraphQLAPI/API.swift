//
//  Question.swift
//  NativeTTS
//
//  Created by Kay, Jordan (He/Him/His) on 3/13/25.
//

import Schemata
import enum Catenary.Request
import class Papyrus.Provider
import protocol Catenary.API
import protocol Catenary.Fields
import protocol TrivialService.QuestionFields

public struct API<
	Endpoint: GraphQLAPI.Endpoint,
	QuestionSpecifiedFields: QuestionFields & Fields & ModelProjection
>: @unchecked Sendable {
	public let endpoint: Endpoint
}

// MARK: -
public extension API {
    func specifyingQuestionFields<Fields>(_: Fields.Type) -> API<Endpoint, Fields> {
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
	public typealias APIError = Request.Error
}

