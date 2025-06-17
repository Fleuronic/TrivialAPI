// Copyright © Fleuronic LLC. All rights reserved.

import Foundation

public extension JSONDecoder {
	static let decoder = {
		let decoder = JSONDecoder()
//		decoder.keyDecodingStrategy = .convertFromSnakeCase
		return decoder
	}()
}
