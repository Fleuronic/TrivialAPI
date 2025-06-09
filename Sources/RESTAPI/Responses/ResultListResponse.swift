//
//  File.swift
//  Services
//
//  Created by Kay, Jordan (He/Him/His) on 4/7/25.
//

private import MemberwiseInit

@MemberwiseInit(.public)
public struct ResultListResponse<Result: Decodable>: Response {
    public let responseCode: Int
    public let results: [Result]
}
