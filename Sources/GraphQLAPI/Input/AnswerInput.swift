// Copyright © Fleuronic LLC. All rights reserved.

import MemberwiseInit
import SociableWeaver
import struct Trivial.Answer
import struct Trivial.Category
import struct Trivial.Question
import struct TrivialService.IdentifiedAnswer
import struct Catenary.Schema
import struct Catenary.ArgumentList
import struct Catena.IDFields
import protocol Catenary.Input
import protocol Catenary.Schematic

@_UncheckedMemberwiseInit(.public)
public struct AnswerInput<Schematic: Catenary.Schematic> {
	public let value: Model.Value

	private let questionID: Question.ID
}

// MARK: -
extension AnswerInput: Input {
	// MARK: Fields
	public typealias Model = Answer.Identified

	// MARK: Input
	public var argumentList: ArgumentList {
		.init(
			schema: Schematic.schema,
			(\Model.value.text, value.text),
			(\Model.value.isCorrect, value.isCorrect),
			(\Model.question.id, questionID)
		)
	}
}
