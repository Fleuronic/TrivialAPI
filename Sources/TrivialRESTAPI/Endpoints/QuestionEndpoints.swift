//
//  File.swift
//  Services
//
//  Created by Kay, Jordan (He/Him/His) on 4/7/25.
//

public import Papyrus

import Foundation

@API @Mock @JSON(decoder: TrivialDecoder())
public protocol QuestionEndpoints {
    @GET("")
    func getQuestions<Fields>(
        amount: Int?,
        type: String?,
        category: Int?
    ) async throws -> QuestionsResponse<Fields>
}
