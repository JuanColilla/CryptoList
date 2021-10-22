//
//  FiatWallet.swift
//  BitPanda_Test
//
//  Created by Juan Colilla on 21/10/21.
//
//   let fiatwallet = try? newJSONDecoder().decode(Fiatwallet.self, from: jsonData)
//   let fiatwalletAttributes = try? newJSONDecoder().decode(FiatwalletAttributes.self, from: jsonData)


import Foundation

// MARK: - Fiatwallet
struct Fiatwallet: Codable {
    let type: String?
    let attributes: FiatwalletAttributes?
    let id: String?
}

// MARK: - FiatwalletAttributes
struct FiatwalletAttributes: Codable {
    let fiatID, fiatSymbol, balance, name: String?
    let pendingTransactionsCount: Int?

    enum CodingKeys: String, CodingKey {
        case fiatID = "fiat_id"
        case fiatSymbol = "fiat_symbol"
        case balance, name
        case pendingTransactionsCount = "pending_transactions_count"
    }
}
