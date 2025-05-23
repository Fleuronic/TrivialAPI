// Copyright © Fleuronic LLC. All rights reserved.

public import Papyrus

import Foundation
import Serialization
import struct Trivial.Question
import struct Catenary.Response
import protocol Catenary.Fields

@API @Mock @JSON(decoder: .decoder)
public protocol Endpoint {
    @POST("")
	func run<Fields>(_ query: Field<Query<Fields>>) async throws -> Catenary.Response<Fields>
}
