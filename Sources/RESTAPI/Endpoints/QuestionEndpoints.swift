// Copyright © Fleuronic LLC. All rights reserved.

public import Papyrus

import Foundation
import Serialization
import struct Trivial.Question

@API @Mock
public protocol QuestionEndpoints {
    @GET("")
    func getQuestions<Fields>(
        type: Question.QuestionType?,
        category: Int?,
        difficulty: Question.Difficulty?,
        amount: Int
    ) async throws -> QuestionsResponse<Fields>
}
