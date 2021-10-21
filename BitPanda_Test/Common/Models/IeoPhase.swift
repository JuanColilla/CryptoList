//
//  IeoPhase.swift
//  BitPanda_Test
//
//  Created by Juan Colilla on 21/10/21.
//
//   let ieoPhase = try? newJSONDecoder().decode(IeoPhase.self, from: jsonData)
//   let ieoPhaseAttributes = try? newJSONDecoder().decode(IeoPhaseAttributes.self, from: jsonData)

import Foundation

// MARK: - IeoPhase
struct IeoPhase: Codable {
    let type: String?
    let attributes: IeoPhaseAttributes?
    let id: String?
}

// MARK: - IeoPhaseAttributes
struct IeoPhaseAttributes: Codable {
    let name: String?
    let phaseNumber: Int?
    let startDate, endDate: EndDateClass?
    let maxStock, price: String?
    let active: Bool?

    enum CodingKeys: String, CodingKey {
        case name
        case phaseNumber = "phase_number"
        case startDate = "start_date"
        case endDate = "end_date"
        case maxStock = "max_stock"
        case price, active
    }
}
