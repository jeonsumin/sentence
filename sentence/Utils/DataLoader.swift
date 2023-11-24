//
//  DataLoader.swift
//  sentence
//
//  Created by Terry on 2023/11/24.
//

import Foundation

struct DataLoader {
    static func load<T: Codable>(json: [String:Any], for type: T.Type) throws -> T {

        let jsonData = try JSONSerialization.data(withJSONObject: json, options: [])
        let model = try JSONDecoder().decode(T.self, from: jsonData)
        return model
    }
}

enum JSONError: Error {
    case notFound
}
