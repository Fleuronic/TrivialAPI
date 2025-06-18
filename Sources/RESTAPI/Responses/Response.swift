// Copyright © Fleuronic LLC. All rights reserved.

protocol Response: Decodable {
    var responseCode: Int { get }
}
