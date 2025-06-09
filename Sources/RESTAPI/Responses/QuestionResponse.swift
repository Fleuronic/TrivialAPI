// Copyright © Fleuronic LLC. All rights reserved.

import struct Trivial.Question
import protocol TrivialService.QuestionFields
import protocol Catenary.Fields

public typealias QuestionsResponse<Fields: QuestionFields & Catenary.Fields> = ResultListResponse<Fields>
