// Copyright © Fleuronic LLC. All rights reserved.

import SociableWeaver
import struct Trivial.Question

extension Question.Difficulty: SociableWeaver.ArgumentValueRepresentable {
	// MARK: ArgumentValueRepresentable
	public var argumentValue: String { encoded }
}
