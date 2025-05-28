// Copyright © Fleuronic LLC. All rights reserved.

import Schemata
import struct Trivial.Question
import struct Trivial.Answer
import struct Trivial.Category
import struct TrivialService.IdentifiedQuestion
import struct TrivialService.IdentifiedAnswer
import struct Catenary.Query
import struct Catenary.Schema
import class TrivialService.IdentifiedCategory
import protocol Catena.Fields
import protocol Catenary.Fields

public struct Query<Fields: Catenary.Fields & ModelProjection> where Fields.Model: Model {
    let schema: Schema
}

// MARK: -
extension Query: Encodable {
	public func encode(to encoder: any Encoder) throws {
		let keyPaths = Fields.projection.keyPaths
		let query = Catenary.Query(
			name: Fields.Model.schemaName,
            paths: keyPaths.map { schema[$0] }
		)

        try query.encode(to: encoder)
	}
}
