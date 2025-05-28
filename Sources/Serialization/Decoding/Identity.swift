//
//  File.swift
//  TrivialAPI
//
//  Created by Jordan Kay on 5/23/25.
//

import Identity
import AutoCodable
import struct Catena.IDFields

@AutoDecodable(accessControl: .public)
extension IDFields: Swift.Decodable where Model.ID: Decodable {
	// MARK: Decodable
	public enum CodingKeys: String, CodingKey {
		case id
	}
}
