// Copyright © Fleuronic LLC. All rights reserved.

import struct Trivial.Question
import protocol TrivialService.QuestionFields

public typealias QuestionsResponse<Fields: QuestionFields & Decodable> = ResultListResponse<Fields>
