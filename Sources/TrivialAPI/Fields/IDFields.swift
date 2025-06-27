// Copyright © Fleuronic LLC. All rights reserved.

import Identity
import Caesura
import struct Catena.IDFields
import protocol Catenary.Fields

extension IDFields: Catenary.Fields where Fields.Model.RawIdentifier: Decodable {
	// MARK: Fields
	public static func decoded(from decoder: any Decoder) throws -> Self {
		try .init(from: decoder)
	}
}
