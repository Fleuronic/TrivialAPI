// Copyright © Fleuronic LLC. All rights reserved.

public import Papyrus

import Foundation
import struct Trivial.Question
import struct Catenary.Response
import protocol Catenary.Fields

@API @Mock @JSON(decoder: Decoder())
public protocol Endpoint {
    @POST("")
	func run<Fields>(_ query: Field<Query<Fields>>) async throws -> Response<Fields>
}

// MARK: -
private final class Decoder: JSONDecoder, @unchecked Sendable {
	// MARK: JSONDecoder
	override public init() {
		super.init()

		keyDecodingStrategy = .convertFromSnakeCase
	}
}
