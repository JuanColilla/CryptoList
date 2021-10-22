//
//  DataClass.swift
//  BitPanda_Test
//
//  Created by Juan Colilla on 21/10/21.
//
//   let dataClass = try? newJSONDecoder().decode(DataClass.self, from: jsonData)
//   let dataAttributes = try? newJSONDecoder().decode(DataAttributes.self, from: jsonData)

import Foundation

// MARK: - DataClass
struct DataClass: Codable {
    let type: String?
    let attributes: DataAttributes?
}

// MARK: - DataAttributes
struct DataAttributes: Codable {
    let cryptocoins, commodities: [Commodity]?
    let fiats: [Fiat]?
    let wallets, commodityWallets: [Wallet]?
    let fiatwallets: [Fiatwallet]?

    enum CodingKeys: String, CodingKey {
        case cryptocoins, commodities, fiats, wallets
        case commodityWallets = "commodity_wallets"
        case fiatwallets
    }
}
