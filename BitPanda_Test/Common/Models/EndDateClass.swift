//
//  EndDateClass.swift
//  BitPanda_Test
//
//  Created by Juan Colilla on 21/10/21.
//
//   let endDateClass = try? newJSONDecoder().decode(EndDateClass.self, from: jsonData)

import Foundation

// MARK: - EndDateClass
struct EndDateClass: Codable {
    let dateIso8601: Date?
    let unix: String?

    enum CodingKeys: String, CodingKey {
        case dateIso8601 = "date_iso8601"
        case unix
    }
}
