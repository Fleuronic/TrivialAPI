// Copyright © Fleuronic LLC. All rights reserved.

import SociableWeaver
import struct Trivial.Question

extension Question.QuestionType: SociableWeaver.ArgumentValueRepresentable {
	// MARK: ArgumentValueRepresentable
	public var argumentValue: String { encoded }
}
