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

//	init<each Clause: Catenary.Clause> (
//		name: ((String) -> String)? = nil,
//		fieldsName: String? = nil,
//		count: Int? = nil,
//		_ clause: repeat (each Clause)?
//	)  {
//		self.name = name
//		self.fieldsName = fieldsName
//		self.count = count
//
//		var argumentList = ArgumentList()
//		for clause in repeat each clause {
//			clause.map { argumentList.append($0) }
//		}
//
//		self.argumentList = argumentList
//	}

	init(
		name: ((String) -> String)? = nil,
		fieldsName: String? = nil,
		count: Int? = nil
	)  {
		self.name = name
		self.fieldsName = fieldsName
		self.count = count
		self.argumentList = .init()
	}

	init<
		Clause: Catenary.Clause
	> (
		name: ((String) -> String)? = nil,
		fieldsName: String? = nil,
		count: Int? = nil,
		_ clause: Clause?
	) where
        Clause.Model == Fields.Model,
        Clause.Schematic == Schematic {
		self.name = name
		self.fieldsName = fieldsName
		self.count = count

		var argumentList = ArgumentList()
		clause.map { argumentList.append($0) }

		self.argumentList = argumentList
	}

	init<
		Clause1: Catenary.Clause,
		Clause2: Catenary.Clause
	> (
		name: ((String) -> String)? = nil,
		fieldsName: String? = nil,
		count: Int? = nil,
		_ clause1: Clause1?,
		_ clause2: Clause2?
	) where
		Clause1.Model == Fields.Model,
		Clause2.Model == Fields.Model,
		Clause1.Schematic == Schematic,
		Clause2.Schematic == Schematic {
		self.name = name
		self.fieldsName = fieldsName
		self.count = count

		var argumentList = ArgumentList()
		clause1.map { argumentList.append($0) }
		clause2.map { argumentList.append($0) }

		self.argumentList = argumentList
	}

	init<
		Clause1: Catenary.Clause,
		Clause2: Catenary.Clause,
		Clause3: Catenary.Clause
	> (
		name: ((String) -> String)? = nil,
		fieldsName: String? = nil,
		count: Int? = nil,
		_ clause1: Clause1?,
		_ clause2: Clause2?,
		_ clause3: Clause3?
	) where
		Clause1.Model == Fields.Model,
		Clause2.Model == Fields.Model,
		Clause3.Model == Fields.Model,
		Clause1.Schematic == Schematic,
		Clause2.Schematic == Schematic,
		Clause3.Schematic == Schematic {
		self.name = name
		self.fieldsName = fieldsName
		self.count = count

		var argumentList = ArgumentList()
		clause1.map { argumentList.append($0) }
		clause2.map { argumentList.append($0) }
		clause3.map { argumentList.append($0) }

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
