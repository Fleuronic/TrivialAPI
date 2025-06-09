// Copyright © Fleuronic LLC. All rights reserved.

import Papyrus
import Foundation
import Serialization
import struct Trivial.Question
import struct Catenary.Response
import protocol Catenary.Fields

@API @Mock @JSON(decoder: .decoder)
public protocol Endpoint {
    @POST("")
	func run<T, Fields>(_ query: Field<Query<T, Fields>>) async throws -> Response<Fields>
}
