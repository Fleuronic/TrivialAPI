//
//  Question+Decodable.swift
//  NativeTTS
//
//  Created by Kay, Jordan (He/Him/His) on 3/18/25.
//

import AutoCodable
import struct Trivial.Question

@AutoDecodable(accessControl: .public)
extension Question: Swift.Decodable {
    public enum CodingKeys: String, CodingKey {
        case questionType = "type"
        case category
        case difficulty
        case prompt = "question"
        case correctAnswer
        case incorrectAnswers
    }
}
