// Copyright © Fleuronic LLC. All rights reserved.

import MemberwiseInit
import struct Trivial.Question
import struct Trivial.Category
import struct TrivialService.IdentifiedQuestion
import struct Catenary.ArgumentList
import protocol Catenary.Input
import protocol Catenary.Schematic

public struct QuestionInput<Schematic: Catenary.Schematic> {
	public let value: Model.Value

	private let categoryID: Category.ID
}

// MARK: -
extension QuestionInput: Input {
	// MARK: Fields
	public typealias Model = Question.Identified

	// MARK: Input
	public var argumentList: ArgumentList {
		.init(
			schema: Schematic.schema,
			(\Model.value.prompt, value.prompt),
			(\Model.value.questionType, value.questionType),
			(\Model.value.difficulty, value.difficulty),
			(\Model.category.id, categoryID)
		)
	}
}
