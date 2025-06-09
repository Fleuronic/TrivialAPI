// Copyright © Fleuronic LLC. All rights reserved.

import Schemata
import struct Catena.IDFields

// TODO
extension IDFields: Schemata.ModelProjection where Model: Schemata.Model {
	public static var projection: Projection<Model, Self> {
		.init(
			Self.init,
			Model.schema
				.properties
				.values
				.first { $0.path == "id" }!
				.keyPath as! KeyPath<Model, Model.ID>
		)
	}
}
