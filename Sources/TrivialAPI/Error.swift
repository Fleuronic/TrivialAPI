// Copyright © Fleuronic LLC. All rights reserved.

import Papyrus
import class TrivialRESTAPI.TrivialDecoder

public struct Error: Swift.Error, Equatable, Decodable {
	public let responseCode: Int
}

// MARK: -
extension Error: CustomStringConvertible {
	public var description: String {
		let message = "You have exceeded the rate limit for fetching questions."
        let action = "Please try again later (error code \(responseCode))."
        return "\(message) \(action)"
	}
}

// MARK: -
extension PapyrusResponse {
	var apiError: Error? {
		do {
			try validate()
			return nil
		} catch {
			let decoder = TrivialDecoder()
			return body.flatMap { try? decoder.decode(Error.self, from: $0) }
		}
	}
}
