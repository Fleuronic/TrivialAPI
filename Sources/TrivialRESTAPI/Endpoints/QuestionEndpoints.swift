//
//  File.swift
//  Services
//
//  Created by Kay, Jordan (He/Him/His) on 4/7/25.
//

public import Papyrus

import Foundation
import struct Trivial.Question

@API @Mock @JSON(decoder: TrivialDecoder())
public protocol QuestionEndpoints {
    @GET("")
    func getQuestions<Fields>(
        type: Question.QuestionType?,
        category: Int?,
        difficulty: Question.Difficulty?,
        amount: Int
    ) async throws -> QuestionsResponse<Fields>
}
