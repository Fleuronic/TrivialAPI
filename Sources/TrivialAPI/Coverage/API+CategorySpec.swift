// Copyright © Fleuronic LLC. All rights reserved.

import struct Trivial.Category
import protocol Catena.Scoped
import protocol Catena.ResultProviding
import protocol Catenary.Fields
import protocol Catenoid.Fields
import protocol TrivialService.CategorySpec

extension API: CategorySpec where CategorySpecifiedFields: Catenary.Fields & Catenoid.Fields<Category.Identified> {
	public typealias CategoryList = Results<CategorySpecifiedFields>
}
