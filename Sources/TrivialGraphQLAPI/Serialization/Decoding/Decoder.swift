//
//  File.swift
//  Services
//
//  Created by Kay, Jordan (He/Him/His) on 4/7/25.
//

import Foundation

public final class TrivialDecoder: JSONDecoder, @unchecked Sendable {
	// MARK: JSONDecoder
    override public init() {
        super.init()

        keyDecodingStrategy = .convertFromSnakeCase
    }
}
