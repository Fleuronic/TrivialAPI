// Copyright © Fleuronic LLC. All rights reserved.

import Identity
import TrivialService
import struct Catena.IDFields
import protocol Catenary.Fields

extension IDFields: Fields where Fields.Model.RawIdentifier: Codable {
    // MARK: Fields
    public static func decoded(from decoder: any Decoder) throws -> Self {
        try .init(from: decoder)
    }
}
