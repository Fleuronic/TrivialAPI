// Copyright © Fleuronic LLC. All rights reserved.

import Identity
import struct Catena.IDFields
import protocol Catenary.Fields

extension IDFields: Fields, Swift.Decodable where Model.ID: Decodable {
    // MARK: Fields
    public static func decoded(from decoder: any Decoder) throws -> Self {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        return try self.init(id: container.decode(for: .id))
    }
}

// MARK: -
private extension IDFields {
    enum CodingKeys: String, CodingKey {
        case id
    }
}
