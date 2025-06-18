// Copyright © Fleuronic LLC. All rights reserved.

private import MemberwiseInit

@MemberwiseInit(.public)
public struct ResultListResponse<Result: Decodable>: Response {
    public let responseCode: Int
    public let results: [Result]
}
