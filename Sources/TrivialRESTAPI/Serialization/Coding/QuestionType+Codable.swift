//
//  File.swift
//  TrivialAPI
//
//  Created by Kay, Jordan (He/Him/His) on 5/2/25.
//

import AutoCodable
import struct Trivial.Question

@AutoEncodable(accessControl: .public, container: .singleValueForEnum)
@AutoDecodable(accessControl: .public, container: .singleValueForEnum)
extension Question.QuestionType: Codable {
    public enum CodingKeys: String, CodingKey {
        case multipleChoice = "multiple"
        case trueFalse = "boolean"
    }
}
