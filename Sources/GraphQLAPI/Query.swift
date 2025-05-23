// Copyright © Fleuronic LLC. All rights reserved.

import Schemata
import struct Catenary.Query
import protocol Catena.Fields
import protocol Catenary.Fields

public struct Query<Fields: Catenary.Fields & ModelProjection> where Fields.Model: Model {
	public init() {}
}

// MARK: -
extension Query: Encodable {
	public func encode(to encoder: any Encoder) throws {
		let query = Catenary.Query(
			name: Fields.Model.schemaName,
			fieldNames: Fields.projection.keyPaths.map { keyPath in
				Fields.Model.schema.properties[keyPath]!.path
			}
		)

		try query.encode(to: encoder)
	}
}
