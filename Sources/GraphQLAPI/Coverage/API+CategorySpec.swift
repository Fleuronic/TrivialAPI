// Copyright © Fleuronic LLC. All rights reserved.

import struct Trivial.Category
import protocol Catena.Scoped
import protocol TrivialService.CategorySpec

extension API: CategorySpec {
	#if swift(<6.0)
	public typealias CategoryListFields = CategorySpecifiedFields
	#endif
 
	public func listCategories() async -> Results<CategorySpecifiedFields> {
		await result {
			try await endpoint.run(Query<Self, _>()).fields
		}
	}
}
