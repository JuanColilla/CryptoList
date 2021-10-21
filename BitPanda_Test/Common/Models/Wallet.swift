//
//  Wallet.swift
//  BitPanda_Test
//
//  Created by Juan Colilla on 21/10/21.
//
//   let wallet = try? newJSONDecoder().decode(Wallet.self, from: jsonData)
//   let commodityWalletAttributes = try? newJSONDecoder().decode(CommodityWalletAttributes.self, from: jsonData)

import Foundation

// MARK: - Wallet
struct Wallet: Codable {
    let type: CommodityWalletType?
    let attributes: CommodityWalletAttributes?
    let id: String?
}

// MARK: - CommodityWalletAttributes
struct CommodityWalletAttributes: Codable {
    let cryptocoinID, cryptocoinSymbol, balance: String?
    let isDefault: Bool?
    let name: String?
    let pendingTransactionsCount: Int?
    let deleted: Bool?

    enum CodingKeys: String, CodingKey {
        case cryptocoinID = "cryptocoin_id"
        case cryptocoinSymbol = "cryptocoin_symbol"
        case balance
        case isDefault = "is_default"
        case name
        case pendingTransactionsCount = "pending_transactions_count"
        case deleted
    }
}
