//
//  File.swift
//  Services
//
//  Created by Kay, Jordan (He/Him/His) on 4/7/25.
//

protocol Response: Decodable {
    var responseCode: Int { get }
}
