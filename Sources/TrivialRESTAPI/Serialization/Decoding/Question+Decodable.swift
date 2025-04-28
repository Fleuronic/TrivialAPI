//
//  Question+Decodable.swift
//  NativeTTS
//
//  Created by Kay, Jordan (He/Him/His) on 3/18/25.
//

import struct Trivial.Question

import AutoCodable

@AutoDecodable(accessControl: .public)
extension Question: Swift.Decodable {
    public enum CodingKeys: String, CodingKey {
        case prompt = "question"
        case correctAnswer
        case incorrectAnswers
    }
}
