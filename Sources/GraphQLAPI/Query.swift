// Copyright © Fleuronic LLC. All rights reserved.

import Schemata
import struct Catenary.Query
import struct Catenary.Schema
import struct Catenary.ArgumentList
import protocol Catena.Fields
import protocol Catenary.Fields
import protocol Catenary.Clause
import protocol Catenary.Schematic

public struct Query<
	Schematic: Catenary.Schematic,
	Fields: Catenary.Fields & ModelProjection
> where Fields.Model: Model {
	let name: ((String) -> String)? // TODO
	let fieldsName: String?
	let argumentList: ArgumentList?
	let count: Int?

	init<each Clause: Catenary.Clause> (
		name: ((String) -> String)? = nil,
		fieldsName: String? = nil,
		count: Int? = nil,
		_ clause: repeat (each Clause)?
	) {
		self.name = name
		self.fieldsName = fieldsName
		self.count = count

		var argumentList = ArgumentList()
		for clause in repeat each clause {
			clause.map { argumentList.append($0) }
		}

		self.argumentList = argumentList
	}
}

// MARK: -
extension Query: Encodable {
	public func encode(to encoder: any Encoder) throws {
		let keyPaths = Fields.projection.keyPaths
		let schema = Schematic.schema
		let schemaName = Fields.Model.schemaName
		let query = Catenary.Query(
			name: name?(schemaName) ?? schemaName,
			type: name == nil ? .query : .mutation,
			argumentList: argumentList,
            fields: keyPaths.map { schema[$0] },
			fieldsName: fieldsName,
			slice: count.map { (amount: $0, offset: 0) }
		)

        try query.encode(to: encoder)
	}
}
