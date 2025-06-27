// Copyright © Fleuronic LLC. All rights reserved.

import struct Trivial.Category
import protocol Catena.ResultProviding
import protocol Catenoid.Fields
import protocol TrivialService.CategorySpec

extension API: CategorySpec where CategorySpecifiedFields: Fields<Category.Identified> {
	public typealias CategoryList = Results<CategorySpecifiedFields>
}
