// Copyright © Fleuronic LLC. All rights reserved.

import Schemata
import struct Trivial.Question

extension Question: Schemata.Model {
	// MARK: Model
	public enum Path: String {
		case prompt
	}

	public static let schema = Schema(
		Self.init,
		\.prompt * .prompt
	)

	public static let schemaName = "questions"
}
