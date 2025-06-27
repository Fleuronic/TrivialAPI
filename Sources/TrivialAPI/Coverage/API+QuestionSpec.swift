// Copyright © Fleuronic LLC. All rights reserved.

import struct Trivial.Question
import protocol Catena.ResultProviding
import protocol Catenoid.Fields
import protocol TrivialService.QuestionSpec

extension API: QuestionSpec where QuestionSpecifiedFields: Fields<Question.Identified> {
	public typealias QuestionFetch = SingleResult<QuestionSpecifiedFields>
	public typealias QuestionList = Results<QuestionSpecifiedFields>
}
