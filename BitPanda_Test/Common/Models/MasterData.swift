//
//  MasterData.swift
//  BitPanda_Test
//
//  Created by Juan Colilla on 21/10/21.
//
//   let masterdata = try? newJSONDecoder().decode(Masterdata.self, from: jsonData)

import Foundation

// MARK: - Masterdata
struct Masterdata: Codable {
    let data: DataClass?
}
