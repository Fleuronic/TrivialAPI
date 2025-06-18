// Copyright © Fleuronic LLC. All rights reserved.

import Papyrus
import Foundation

public struct APIError: Error, Equatable, Decodable {
	public let responseCode: Int
}

// MARK: -
extension APIError: CustomStringConvertible {
	public var description: String {
		let message = "You have exceeded the rate limit for fetching questions."
        let action = "Please try again later (error code \(responseCode))."
        return "\(message) \(action)"
	}
}

// MARK: -
extension PapyrusResponse {
	var apiError: APIError? {
		do {
			try validate()
			return nil
		} catch {
			let decoder = JSONDecoder()
			return body.flatMap { try? decoder.decode(APIError.self, from: $0) }
		}
	}
}
