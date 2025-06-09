// Copyright © Fleuronic LLC. All rights reserved.

import MemberwiseInit
import SociableWeaver
import struct Trivial.Question
import struct Trivial.Category
import struct TrivialService.IdentifiedQuestion
import struct Catenary.ArgumentList
import struct Catena.IDFields
import protocol Catenary.Input

//@_UncheckedMemberwiseInit(.public)
//public struct QuestionInput {
//	public let value: Model.Value
//
//	let categoryID: Category.ID
//}
//
//// MARK: -
//extension QuestionInput: Input {
//	// MARK: Fields
//	public typealias Model = Question.Identified
//
//	// MARK: Input
//	public var argumentList: ArgumentList {
//		.init(
//			[
//				Model.Path.prompt.rawValue: value.prompt,
//				Model.Path.questionType.rawValue: value.questionType,
//				Model.Path.difficulty.rawValue: value.difficulty,
//				"category_id": categoryID
//			]
//		)
//	}
//}
